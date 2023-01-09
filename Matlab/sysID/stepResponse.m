%% Init
clear all;close all;clc
addpath('..\')

%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% where to find the data
out_path = '..\data\';
out_folder = '0_stepInput\';
out_names = {'pitch5V','roll2V','yaw24V'};

% where to store continuous tf
store_path = '..\store\';
file_Gs = 'Gs-cont-models';

% samplig time
TsOL = 5; % sampling time used to acquire data in OL
Ts = 50;   % sampling time in CL (based on result of step responses section)

% time before steady state is reached
t_SS = 25;

% # of output channel stacked in the output log file
% [p_meas,r_meas,y_meas,p_ref,r_ref,y_ref,F_u,B_u,L_u,R_u,p_u,r_u,y_u]
nb = 13;

%*************************************************************************%
drop = floor(Ts/TsOL); % downsamplig coef (Ts must be multiple of TsOL)
Ts = Ts/1000;
cutSS = t_SS/Ts;
s=tf('s');
z=tf('z',Ts);

%% Step responses %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%*************************** PITCH ***************************************%
% get data
channel = 1; 
%load
data = f.openBin([out_path out_folder],out_names{channel},nb);
stepD = data(1:drop:end,channel);
% remove time to reach SS
stepD = stepD(cutSS+1:end-cutSS);
% remove offset
stepD = stepD-stepD(1);
% normalize
stepD = stepD/5;
% time vector
T = (0:length(stepD)-1)*Ts;  

% model 
tgamma = 30; % average gain on tgamma seconds
ngamma = tgamma/Ts; % equivalent # of sample
gamma = mean(stepD(end-ngamma:end)); % average over last # sample
f0 = 1/mean(diff([1.585 4.58 7.395 10.115]));
wn_p = 2*pi*f0;
xsi = 0.15;
th = 0.2;
Gp = exp(-th*s)*tf([gamma*wn_p^2],[1 2*xsi*wn_p wn_p^2]);
stepM = step(Gp,T);

% sampling time for designed model
bw_p = bandwidth(Gp);
fprintf('%.2f < Ts_pitch < %.2f\n',2*pi/30/bw_p,2*pi/20/bw_p)

% final plot, validation
figure()
hold on; grid on; axis tight;
plot(T,stepD,T,stepM);
title('Step response');legend('scaled data','model')
xlabel('time [s]');ylabel('$\theta_{out}$ [deg]','interpreter','latex')
hold off;

% store
save([store_path file_Gs],'Gp');

%*************************** ROLL ****************************************%
% get data
channel = 2; 
%load
data = f.openBin([out_path out_folder],out_names{channel},nb);
stepD = data(1:drop:end,channel);
% remove time to reach SS
stepD = stepD(cutSS+1:end-cutSS);
% remove offset
stepD = stepD-stepD(1);
% normalize
stepD = stepD/2;
% time vector
T = (0:length(stepD)-1)*Ts; 


% model
tgamma = 30; % average gain on tgamma seconds
ngamma = tgamma/Ts; % equivalent # of sample
gamma = mean(stepD(end-ngamma:end)); % average over last # sample
f0 = 1/mean(diff([2.48 6.99 11.545 16.29 20.93]));
wn_r = 2*pi*f0;
xsi = 0.01;
th = 0.15;
Gr = exp(-th*s)*tf([gamma*wn_r^2],[1 2*xsi*wn_r wn_r^2]);
stepM = step(Gr,T);

% sampling time for designed model
bw_r = bandwidth(Gr);
fprintf('%.2f < Ts_roll < %.2f\n',2*pi/30/bw_r,2*pi/20/bw_r)

% final plot, validation
figure()
hold on; grid on; axis tight;
plot(T,stepD,T,stepM);
title('Step response');legend('scaled data','model')
xlabel('time [s]');ylabel('$\theta_{out}$ [deg]','interpreter','latex')
hold off;

% store
save([store_path file_Gs],'Gr','-append');

%**************************** YAW ****************************************%
% get data
channel = 3;
%load
data = f.openBin([out_path out_folder],out_names{channel},nb);
stepD = data(1:drop:end,channel);
% remove time to reach SS
stepD = stepD(cutSS+1:end-cutSS);
% remove offset
stepD = stepD-stepD(1);
% normalize
stepD = stepD/(24-4);
% convert to speed data
stepDd = diff(stepD)/Ts;
% time vector
T = (0:length(stepDd)-1)*Ts;  

% model
tgamma = 5; % time in ss at end of simulation
ngamma = tgamma/Ts;
gamma = mean(stepDd((end-ngamma):end));
v63 = 0.63*(gamma);
[val,idx] = min(abs(stepDd-v63));
tau = idx*Ts;
th=0;
Gyd = exp(-th*s)*gamma/(tau*s+1);
stepMd = step(Gyd,T);
Gy = Gyd/s;
stepM = step(Gy,T);

% sampling time for designed model
Tr = stepinfo(Gyd).RiseTime;
fprintf('%.2f < Ts_yaw < %.2f\n',Tr/10,Tr/5)

% final plot, validation
figure()
hold on; grid on; axis tight;

subplot(211); plot(T,stepDd,T,stepMd); yline(v63,'--r')
title('Step response');legend('scaled data','model')
xlabel('time [s]');ylabel('$\dot{\theta}_{out}$ [deg]','interpreter','latex')
subplot(212);plot(T,stepD(1:end-1),T,stepM);
xlabel('time [s]');ylabel('$\theta_{out}$ [deg]','interpreter','latex')
hold off;

% store
Gy = Gyd/s;
save([store_path file_Gs],'Gy','-append');
