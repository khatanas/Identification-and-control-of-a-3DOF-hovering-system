%% Init
clear all;close all;clc
addpath('..\')

%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% samplig time
Ts = 50;   % sampling time in CL (based on step response analysis)

% READ: load continuous time models
store_path = '..\store\';
load([store_path 'Gs-cont-models'])

% WRITE: where to store discrete tf and controllers
file_Gds = 'ms50_Gs-disc-models';
file_Ks = 'ms50_stabK0';

% WRITE: export path to labview and corresponding names
ctrl_path = 'Z:\home\lvuser\khatanas\controlers\';
ctrl_name = {'p0_50','r0_50','y0_50','pry0_50'};

%*************************************************************************%
Ts = Ts/1000;
T = 0:Ts:60;
s=tf('s');
z=tf('z',Ts);
OL = f.labviewRST(0,1,1,'solo');

%% Discretize model
%*************************** PITCH ***************************************%
stepM = step(Gp,T);

% discretized model 
Gd = c2d(Gp,Ts);
Ap = Gd.Denominator{1};
Bp = Gd.Numerator{1};
dp = Gd.OutputDelay;
Gd = tf(Bp,Ap,Ts,'variable','q^-1','IODelay',dp);
stepMd = step(Gd,T);

figure()
hold on;
plot(T,stepM);stairs(T,stepMd);title('Pitch')

% store
Gpd = Gd;
save([store_path file_Gds],'Gpd');

%*************************** ROLL ****************************************%
stepM = step(Gr,T);

% discretized model 
Gd = c2d(Gr,Ts);
Ar = Gd.Denominator{1};
Br = Gd.Numerator{1};
dr = Gd.OutputDelay;
Gd = tf(Br,Ar,Ts,'variable','q^-1','IODelay',dr);
stepMd = step(Gd,T);

figure(); 
hold on;
plot(T,stepM);stairs(T,stepMd);title('Roll')

% store
Grd = Gd;
save([store_path file_Gds],'Grd','-append');

% %*************************** YAW ****************************************%
stepM = step(Gy,T);

% discretized model 
Gd = c2d(Gy,Ts);
Ay = Gd.Denominator{1};
By = Gd.Numerator{1};
dy = Gd.OutputDelay;
Gd = tf(By,Ay,Ts,'variable','q^-1','IODelay',dy);
stepMd = step(Gd,T);

figure(); 
hold on;
plot(T,stepM);stairs(T,stepMd);title('Yaw')

% store
Gyd = Gd;
save([store_path file_Gds],'Gyd','-append');

%% RST design
close all;clc
%*************************** PITCH ***************************************%
% desired poles
wn_pd = sqrt(Gp.Denominator{1}(end));
xsi = 0.71;                           % increase damping
p1 = -2*exp(-xsi*wn_pd*Ts)*cos(wn_pd*Ts*sqrt(1-xsi^2));
p2 = exp(-2*xsi*wn_pd*Ts);
P = [1 p1 p2];
rootsP = roots(P)

% additionnal terms
Hs = [1 -1];
Hr = [1 1];

% get Pmax
[~, ~, ~, Pmax] = f.generateRST(Ap,Bp,dp,P,Hr,Hs);

% add auxiliary poles
alpha = 0.4;
Pf = [1 -alpha];

while length(P)<=Pmax
    P = conv(P,Pf);
end

% get coeffs
[R0,S0,T0] = f.generateRST(Ap,Bp,dp,P,Hr,Hs);
stabPitch = {R0,S0,T0};
Pp = P;


% % store
% save([store_path file_Ks],'stabPitch');
% % export to myRIO
% pitchSolo = f.labviewRST(R0,S0,T0,'solo');
% f.writeBin(ctrl_path,ctrl_name{1},f.labviewRST(pitchSolo,OL,OL,'trio'));

%*************************** ROLL ***************************************%
% desired poles
wn_rd = sqrt(Gr.Denominator{1}(end));
xsi = 0.71;                           % increase damping
p1 = -2*exp(-xsi*wn_rd*Ts)*cos(wn_rd*Ts*sqrt(1-xsi^2));
p2 = exp(-2*xsi*wn_rd*Ts);
P = [1 p1 p2];
rootsR = roots(P)
% additionnal terms
Hs = [1 -1];
Hr = [1 1];

% get Pmax
[~, ~, ~, Pmax] = f.generateRST(Ar,Br,dr,P,Hr,Hs);

% add auxiliary poles
alpha = 0.4;
Pf = [1 -alpha];

while length(P)<=Pmax
    P = conv(P,Pf);
end

% get coeffs
[R0,S0,T0] = f.generateRST(Ar,Br,dr,P,Hr,Hs);
stabRoll = {R0,S0,T0};
Pr = P;

% % store
% save([store_path file_Ks],'stabRoll','-append');
% % export to myRIO
% rollSolo = f.labviewRST(R0,S0,T0,'solo');
% f.writeBin(ctrl_path,ctrl_name{2},f.labviewRST(OL,rollSolo,OL,'trio'));

%***************************** YAW ***************************************%
% desired poles
p1 = -0.95;
P = [1 p1];

% additionnal terms
Hs = [1 -1];
Hr = [1 1];

% get Pmax
[~, ~, ~, Pmax] = f.generateRST(Ay,By,dy,P,Hr,Hs);

% add auxiliary poles
alpha = 0.8;
Pf = [1 -alpha];

while length(P)<=Pmax
    P = conv(P,Pf);
end

% get coeffs
[R0,S0,T0] = f.generateRST(Ay,By,dy,P,Hr,Hs);
stabYaw = {R0,S0,T0};
Py = P;

% % store
% save([store_path file_Ks],'stabYaw','-append');
% % export to myRIO
% yawSolo = f.labviewRST(R0,S0,T0,'solo');
% f.writeBin(ctrl_path,ctrl_name{3},f.labviewRST(OL,OL,yawSolo,'trio'));
% 
% % export final to myRIO
% f.writeBin(ctrl_path,ctrl_name{4},f.labviewRST(pitchSolo,rollSolo,yawSolo,'trio'));


%% Ttest
close all;
out_path = '..\data\';
out_folder = '\2_test\pry0_50\';
out_names = {'testp0','testr0','testy0'};
nb = 13;

ttraj = 20*[zeros(1,10/Ts) ones(1,10/Ts) -ones(1,10/Ts) ones(1,10/Ts) zeros(1,30/Ts)];
TT = (0:length(ttraj)-1)*Ts;

% Pitch
channel = 1;
data = f.openBin([out_path out_folder],out_names{channel},nb);
sim = lsim(tf(conv(stabPitch{3},[zeros(1,dp) Gpd.Numerator{1}]),Pp,Ts,'variable','z^-1'),ttraj);
figure();
subplot(231);hold on
plot(TT,sim,'--r','Linewidth',1.5);
plot(TT,data(:,channel),'b');
plot(TT,ttraj);
title('Pitch')
legend('lsim y(t)','y(t)','r(t)')
ylabel('\theta [deg]')
hold off;
subplot(234);hold on
plot(TT,data(:,channel+6));
plot(TT,data(:,channel+7));
plot(TT,data(:,channel+8));
plot(TT,data(:,channel+9));
yline(12,'--r')
yline(0,'--r')
ylabel('Motors inputs [V]')
xlabel('t [s]')
legend('V_F','V_B','V_L','V_R')
% f.simulationRSTPlot(Ap,Bp,dp,stabPitch{1},stabPitch{2},stabPitch{3},Pp,Ts)

% Roll
channel = 2;
data = f.openBin([out_path out_folder],out_names{channel},nb);
sim = lsim(tf(conv(stabRoll{3},[zeros(1,dr) Grd.Numerator{1}]),Pr,Ts,'variable','z^-1'),ttraj);
subplot(232);hold on
plot(TT,sim,'--r','Linewidth',1.5);
plot(TT,data(:,channel),'b');
plot(TT,ttraj);
title('Roll')
hold off;
subplot(235);hold on
plot(TT,data(:,channel+5));
plot(TT,data(:,channel+6));
plot(TT,data(:,channel+7));
plot(TT,data(:,channel+8));
xlabel('t [s]')
yline(12,'--r')
yline(0,'--r')
% f.simulationRSTPlot(Ar,Br,dr,stabRoll{1},stabRoll{2},stabRoll{3},Pr,Ts)

% Yaw
channel = 3;
data = f.openBin([out_path out_folder],out_names{channel},nb);
sim = lsim(tf(conv(stabYaw{3},[zeros(1,dy) Gyd.Numerator{1}]),Py,Ts,'variable','z^-1'),ttraj);
subplot(233);hold on
plot(TT,sim,'--r','Linewidth',1.5);
plot(TT,data(:,channel),'b');
plot(TT,ttraj);
title('Yaw')
hold off;
subplot(236);hold on
plot(TT,data(:,channel+4));
plot(TT,data(:,channel+5));
plot(TT,data(:,channel+6));
plot(TT,data(:,channel+7));
xlabel('t [s]')
yline(12,'--r')
yline(0,'--r')
% f.simulationRSTPlot(Ay,By,dy,stabYaw{1},stabYaw{2},stabYaw{3},Py,Ts)


% lsim(tf(conv(stabPitch{3},[zeros(1,dp) Gpd.Numerator{1}]),Pp,Ts,'variable','z^-1'),ttraj)