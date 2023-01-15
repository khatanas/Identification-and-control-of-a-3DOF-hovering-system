%% Init
clear all; close all; clc
addpath('../');
%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% EXPERIMENT INFO
Ts = 50;            
t_SS = 25;
prMode = 'OL';

% INPUT INFO 
% shift register length, frequency divider
n = 10;
fD = 1;

% OUTPUT INFO
% [p_meas,r_meas,y_meas,p_ref,r_ref,y_ref,F_u,B_u,L_u,R_u,p_u,r_u,y_u]
nb = 13;

%*************************************************************************%
% READ: location, folder, file names and # of stacked outputs
out_path = '..\data\';
out_folder = ['1_sysID\ms' int2str(Ts) '\' prMode '\fD' int2str(fD) '\'];
out_names = {'PRBSp','PRBSr','PRBSy'};

% READ: location and file names for discretized model
store_path = '..\store\';
file_Gds = ['ms' int2str(Ts) '_Gs-disc-models'];
Gds = load([store_path file_Gds]);
names_Gds = {'Gpd','Grd','Gyd'};

% WRITE: file name of found G
file_G = ['ms' int2str(Ts) '-G-' prMode '-fD' int2str(fD)];

Ts = Ts/1000;
cutSS = t_SS/Ts;
namesIn = {'pitch_d','roll_d','yaw_d'}';
namesOut = {'pitch','roll','yaw'}';
s=tf('s');
z=tf('z',Ts);
M = fD*(2^n-1);
half = pi/Ts;

%% Import approximated model
G0s = repmat(tf([1e-10],[1],Ts),[3,3]);
for i = 1:3
    G0s(i,i) = getfield(Gds, names_Gds{i});
end
G0s.InputName = namesIn;
G0s.OutputName = namesOut;

%% Import data
for i = 1:3
    % get data
    data = f.openBin([out_path out_folder],out_names{i},nb);
    % remove ss
    data = data(cutSS+1:end,:);
    % remove fst period
    data = data(M+1:end,:);

    % 1:y_pitch,2:y_roll,3:y_yaw
    % 11:u_pitch,12:u_roll,13:u_yaw
    for j = 1:3 
        R2Y{j,i} = data(:,j);
        R2U{j,i} = data(:,10+j);
    end

    % 4:ref_pitch,5:ref_roll,6:ref_yaw
    R2Y{4,i} = data(:,3+i);
    R2U{4,i} = data(:,3+i);   
end

N = numel(R2Y{1,1});
p = N/M;

f.pwrSpectralDensityPlot(R2Y{1,1},M,Ts,1);
%% Get CL matrix: Tau
%init
R2Y_CL = [];
R2U_CL = [];

%pitch_d / roll_d / yaw_d
for i = 1:3
    R2Y_tmp = [];
    R2U_tmp = [];

    %pitch / roll / yaw
    for j = 1:3
        %fourier analysis
        R2Y_DAT = iddata(R2Y{j,i},R2Y{4,i},'Ts',Ts,'Period', M);
        R2Y_tmp = [R2Y_tmp ; etfe(R2Y_DAT)];
        
        R2U_DAT = iddata(R2U{j,i},R2U{4,i},'Ts',Ts,'Period', M);
        R2U_tmp = [R2U_tmp ; etfe(R2U_DAT)];
    end
    %store
    R2Y_CL = [R2Y_CL, R2Y_tmp];
    R2U_CL = [R2U_CL, R2U_tmp];
end

%rename axis
R2Y_CL.InputName = namesIn;
R2Y_CL.OutputName = namesOut;
R2U_CL.InputName = namesIn;
R2U_CL.OutputName = namesOut;

%plot 
figure()
bodemag(R2Y_CL,inv(R2U_CL)); grid minor ;
title('System with controller(s)');legend('T_{yr}','inv(T_{ur})')
%% Get OL matrix: G
G = R2Y_CL*inv(R2U_CL);
G.InputName = namesIn;
G.OutputName = namesOut;

fs = R2Y_CL.Frequency;
f1 = fs(2);
f2 = fs(end);
% f2=10;

figure()
bodemag(G,'oy',G,G0s,'--r',{f1,f2})
grid minor;title('G_{OL}')
legend('sampling points','G','1st approx.')

save([store_path file_G],'G')


