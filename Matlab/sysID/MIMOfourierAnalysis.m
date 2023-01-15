%% Init
clear all; close all; clc
addpath('../');
%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% EXPERIMENT INFO
Ts = 50;            
t_SS = 10;
prMode = 'Dist';

% INPUT INFO 
% shift register length, frequency divider
n = 10;
fD = 1;

% OUTPUT INFO
% [p_meas,r_meas,y_meas,dist_VF,dist_VB,dist_VL,dist_VR,F_u,B_u,L_u,R_u,p_u,r_u,y_u]
nb = 14;

%*************************************************************************%
% READ: location, folder, file names and # of stacked outputs
out_path = '..\data\';
out_folder = ['1_sysID\ms' int2str(Ts) '\' prMode '\fD' int2str(fD) '\'];
out_names = {'PRBSf','PRBSb','PRBSl','PRBSr'};

% READ: location and file names for discretized model
store_path = '..\store\';
file_Gds = ['ms' int2str(Ts) '_Gs-disc-models'];
Gds = load([store_path file_Gds]);
names_Gds = {'Gpd','Grd','Gyd'};

% WRITE: file name of found G
file_G = ['ms' int2str(Ts) '-G-' prMode '-fD' int2str(fD)];

Ts = Ts/1000;
cutSS = t_SS/Ts;
s=tf('s');
z=tf('z',Ts);
M = fD*(2^n-1);
half = pi/Ts;

%% Import data
for i = 1:4
    % get data
    data = f.openBin([out_path out_folder],out_names{i},nb);
    % remove ss
    data = data(cutSS+1:end,:);
    % remove fst period
    data = data(M+1:end,:);

    % DISTURBANCE: 4:dist_VF, 5:dist_VB, 6:dist_VL, 7:dist_VR
    R2Y{4,i} = data(:,3+i);
    R2U{5,i} = data(:,3+i);   
    
    % 3x OUTPUT: 1:y_pitch,2:y_roll,3:y_yaw
    for j = 1:3 
        R2Y{j,i} = data(:,j);
    end
    
    % 4x INPUT: 8:F_u, 9:B_u, 10:L_u, 11:R_u
    for j = 1:4 
        R2U{j,i} = data(:,7+j);
    end
end

N = numel(R2Y{1,1});
p = N/M;

f.pwrSpectralDensityPlot(R2Y{4,1},M,Ts,1);
%% Get CL matrix: Tau
% DISTURBANCE TO OUTPUT
% init
R2Y_CL = []; % 3x4

%from VF/VB/VL/VR (dist)
for i = 1:4
    R2Y_tmp = [];

    %to pitch / roll / yaw (out)
    for j = 1:3
        %fourier analysis
        R2Y_DAT = iddata(R2Y{j,i},R2Y{4,i},'Ts',Ts,'Period', M);
        R2Y_tmp = [R2Y_tmp ; etfe(R2Y_DAT)];
    end
    %store
    R2Y_CL = [R2Y_CL, R2Y_tmp];
end

%rename axis
R2Y_CL.InputName = {'distV_F','distV_B','distV_L','distV_R',}';
R2Y_CL.OutputName = {'pitch','roll','yaw'}';

% DISTURBANCE TO INPUT
R2U_CL = []; % 4x4

%from VF/VB/VL/VR (dist)
for i = 1:4
    R2U_tmp = [];

    %to VF/VB/VL/VR (in)
    for j = 1:4
        %fourier analysis
        R2U_DAT = iddata(R2U{j,i},R2U{5,i},'Ts',Ts,'Period', M);
        R2U_tmp = [R2U_tmp ; etfe(R2U_DAT)];
    end
    %store
    R2U_CL = [R2U_CL, R2U_tmp];
end

%rename axis
R2U_CL.InputName = {'distV_F','distV_B','distV_L','distV_R',}';
R2U_CL.OutputName = {'inV_F','inV_B','inV_L','inV_R',}';

%plot 
figure()
bodemag(R2Y_CL); grid minor ;
title('System with controller(s): Dist2Out');
figure()
bodemag(R2U_CL); grid minor ;
title('System with controller(s): Dist2In');
%% Get OL matrix: G
G = R2Y_CL*inv(R2U_CL);
G.InputName = {'V_F','V_B','V_L','V_R',}';
G.OutputName = {'pitch','roll','yaw'}';

figure()
bodemag(G,'oy',G)
grid minor;title('G_{0}')
legend('sampling points','G_0')

save([store_path file_G],'G')



