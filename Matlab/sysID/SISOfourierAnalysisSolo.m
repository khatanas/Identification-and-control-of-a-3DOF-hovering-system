%% Init
clear all; close all; clc
addpath('../');
%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% EXPERIMENT INFO
Ts = 50;            
t_SS = 10;
prMode = 'CL';

% INPUT INFO 
% shift register length, frequency divider
n = 8;
fD = 5;

% OUTPUT INFO
% [p_meas,r_meas,y_meas,p_ref,r_ref,y_ref,F_u,B_u,L_u,R_u,p_u,r_u,y_u]
nb = 13;

% data file name
out_names = 'PRBSr';
% discretized model tf name(for comparison)
names_Gds = 'Grd';
% store file label
nameSolo = 'rSolo';

%*************************************************************************%
% READ: location, folder, file names and # of stacked outputs
out_path = '..\data\';
out_folder = ['1_sysID\ms' int2str(Ts) '\' prMode '\fD' int2str(fD) '\'];

% READ: location and file names for discretized model
store_path = '..\store\';
file_Gds = ['ms' int2str(Ts) '_Gs-disc-models'];
Gds = load([store_path file_Gds]);

% WRITE: file name of found G
file_G = ['ms' int2str(Ts) '-G-' prMode '-fD' int2str(fD) '-' nameSolo];

Ts = Ts/1000;
cutSS = t_SS/Ts;
namesIn = {'pitch_d','roll_d','yaw_d'}';
namesOut = {'pitch','roll','yaw'}';
s=tf('s');
z=tf('z',Ts);
M = fD*(2^n-1);
half = pi/Ts;

%% Import approximated model
G0s = getfield(Gds, names_Gds);

%% Import data
% get data
data = f.openBin([out_path out_folder],out_names,nb);
% remove ss
data = data(cutSS+1:end,:);
% remove fst period
data = data(M+1:end,:);

% 1:y_pitch,2:y_roll,3:y_yaw
% 11:u_pitch,12:u_roll,13:u_yaw
axis = 2;
R2Y{1,1} = data(:,axis);
R2U{1,1} = data(:,10+axis);

% 4:ref_pitch,5:ref_roll,6:ref_yaw
R2Y{2,1} = data(:,3+axis);
R2U{2,1} = data(:,3+axis);   

N = numel(R2Y{1,1});
p = N/M;

f.pwrSpectralDensityPlot(R2Y{2,1},M,Ts,1);
%% Get CL matrix: Tau

%fourier analysis
R2Y_DAT = iddata(R2Y{1,1},R2Y{2,1},'Ts',Ts,'Period', M);
R2Y_CL = etfe(R2Y_DAT);

R2U_DAT = iddata(R2U{1,1},R2U{2,1},'Ts',Ts,'Period', M);
R2U_CL = etfe(R2U_DAT);

figure()
bodemag(R2Y_CL,R2U_CL); grid minor ;
title('System with controller(s)');legend('T','U')
%% Get OL matrix: G
G = R2Y_CL*inv(R2U_CL);

fs = R2Y_CL.Frequency;
f1 = fs(2);
f2 = fs(end);
f2=10;

figure()
bodemag(G,'oy',G,G0s,'--r',{f1,f2})
grid minor;title('G_{OL}')
legend('sampling points','G','1st approx.')

save([store_path file_G],'G')



