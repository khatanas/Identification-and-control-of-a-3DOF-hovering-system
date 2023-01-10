%% Init
clear all; close all; clc

%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sig_path = 'Z:\home\lvuser\khatanas\signals\';
out_path = 'Z:\home\lvuser\khatanas\outputs\';
ctrl_path = 'Z:\home\lvuser\khatanas\controlers\';

store_path = '.\store\';

% sig_path = 'C:\Users\David\Desktop\ProjSem\3dof\Matlab\trash\';
% out_path = 'C:\Users\David\Desktop\ProjSem\3dof\Matlab\data\';
% ctrl_path = 'C:\Users\David\Desktop\ProjSem\3dof\Matlab\trash\';

%sampling time 
Ts = 50; %ms

%additional time to reach steady-state
t_SS = 10;

%reference signal: length of simulation
t_sim = 60;

%PRBS signal:
p = 7;      %nbr od period
n = 8;     %shift register length
fD = 5;     %frequency divider
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% !!! INPUTS MUST BE ROW-WISE !!!
Ts_sec = Ts/1000;
len_SS = t_SS/Ts_sec;   % corresponding # samples in steady state
len = t_sim/Ts_sec;     % corresponding # samples in trajectory signal

%generate PRBS (+ give infos)
dist = f.generatePRBS(n,p,fD,Ts_sec,1);

%test traj
ttraj = [zeros(1,t_SS/Ts_sec) ones(1,10/Ts_sec) -ones(1,10/Ts_sec) ones(1,10/Ts_sec) zeros(1,20/Ts_sec)];
save([store_path 'ms50-ttraj'], 'ttraj');

%% Create sequences for motor

% *********************** FBLR inputs **************************
nb = 4;
SS = zeros(nb,len_SS);

f.writeBin(sig_path, 'onesM', [SS ones(nb,len)]);
f.writeBin(sig_path, 'distM', [SS repmat(dist',nb,1)]);
f.writeBin(sig_path, 'testM', [SS randi([0,5],nb,len)]);

% ************************* pry inputs  *************************
nb = 3;
SS = zeros(nb,len_SS);

f.writeBin(sig_path, 'onesA', [SS ones(nb,len) SS]);
f.writeBin(sig_path, 'distA', [SS repmat(dist',nb,1)]);
f.writeBin(sig_path, 'ttrajA', [repmat(ttraj,nb,1)]);
f.writeBin(sig_path, 'testA', [SS randi([0,5],nb,len)]);

%% Create controllers
% OL (R=0, S=1, T=1)
OL = f.labviewRST(0,1,1,'solo');

% dummy
dummyP = f.labviewRST(1,2,3,'solo');
dummyR = f.labviewRST([1 2 3],[1 2],1,'solo');
dummyY = OL;

%integrator and loop opening at nyquist
intOpen = f.labviewRST([1 1], [1 -1], 1,'solo');

%export some controllers
f.writeBin(ctrl_path, 'dummy', f.labviewRST(dummyP,dummyR,dummyY,'trio'));
f.writeBin(ctrl_path, 'stabYaw', f.labviewRST(OL,OL,intOpen,'trio'));

%% Read outputs
%# of output channel stacked in the output log file, see save.vi
%for more information

nb = 10;
dataFolder = '221208\';

data = f.openBin([out_path dataFolder],'pDist',nb);
plot(data(:,1))


