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

%% TEST TO BE DELETED
% READ: location and file names for stabilizing controllers
file_K0 = 'ms50_stabK0';
K0 = load([store_path file_K0]);
names_K0 = {'stabPitch','stabRoll','stabYaw'};
%tf(0)
init = repmat(tf([0],[1],Ts),[3,3]);

% controllers to matrix form
K = {init, init, init};
for i = 1:3
    tmp = getfield(K0, names_K0{i}); %pry
    K{1}(i,i) = tf(tmp{1},1,Ts); %R
    K{2}(i,i) = tf(1,tmp{2},Ts); %Sinv
    K{3}(i,i) = tf(tmp{3},1,Ts); %T
end
R = K{1}; 
Sinv = K{2};
T = K{3};

R2YG = R2Y_CL*inv(Sinv*T-Sinv*R*R2Y_CL);
R2UG = R^(-1)*(T*inv(R2U_CL)-inv(Sinv));

bodemag(G,'*',R2YG,R2UG,G0s,'--r',{f1,f2})
legend('G','R2YG','R2UG')

%%
% figure()
% bodemag(G(1,1),G(1,2),G(1,3))
% legend('pp','pr','py')
% figure()
% bodemag(G(2,1),G(2,2),G(2,3))
% legend('rp','rr','ry')
% figure()
% bodemag(G(3,1),G(3,2),G(3,3))
% legend('yp','yr','yy')
% %%
% close all;
% TT = (0:length(R2Y{1,1})-1)*Ts;
% subplot(431)
% plot(TT,R2Y{1,1});title('\theta_{pp}');axis tight
% subplot(434)
% plot(TT,R2Y{2,1});title('\theta_{rp}');axis tight
% subplot(437)
% plot(TT,R2Y{3,1});title('\theta_{yp}');axis tight
% subplot(4,3,10)
% plot(TT,R2Y{4,1});title('ref_p');axis tight
% 
% subplot(432)
% plot(TT,R2Y{1,2});title('\theta_{pr}');axis tight
% subplot(435)
% plot(TT,R2Y{2,2});title('\theta_{rr}');axis tight
% subplot(438)
% plot(TT,R2Y{3,2});title('\theta_{yr}');axis tight
% subplot(4,3,11)
% plot(TT,R2Y{4,2});title('ref_r');axis tight
% 
% subplot(433)
% plot(TT,R2Y{1,3});title('\theta_{py}');axis tight
% subplot(436)
% plot(TT,R2Y{2,3});title('\theta_{ry}');axis tight
% subplot(439)
% plot(TT,R2Y{3,3});title('\theta_{yy}');axis tight
% subplot(4,3,12)
% plot(TT,R2Y{4,3});title('ref_y');axis tight


