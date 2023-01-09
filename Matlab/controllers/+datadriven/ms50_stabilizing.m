%% Init
clear all;close all;clc
addpath('..\')

%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% samplig time
Ts = 50;   % sampling time in CL (based on step response analysis)

% load continuous time models
store_path = '..\store\';
load([store_path 'Gs-cont-models.mat'])

% storing name of discretized tf and associated ctrl
file_Gds = 'ms50_Gs-disc-models';
file_Ks = 'ms50_stabK0';

% export path to labview and corresponding names
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
save([store_path file_Gds], 'Gpd');

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
save([store_path file_Gds], 'Grd','-append');

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
save([store_path file_Gds], 'Gyd','-append');

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

% store
save([store_path file_Ks],'stabPitch');
% export to myRIO
pitchSolo = f.labviewRST(R0,S0,T0,'solo');
f.writeBin(ctrl_path,ctrl_name{1},f.labviewRST(pitchSolo,OL,OL,'trio'));

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

% store
save([store_path file_Ks],'stabRoll','-append');
% export to myRIO
rollSolo = f.labviewRST(R0,S0,T0,'solo');
f.writeBin(ctrl_path,ctrl_name{2},f.labviewRST(OL,rollSolo,OL,'trio'));

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

% store
save([store_path file_Ks],'stabYaw','-append');
% export to myRIO
yawSolo = f.labviewRST(R0,S0,T0,'solo');
f.writeBin(ctrl_path,ctrl_name{3},f.labviewRST(OL,OL,yawSolo,'trio'));

% export final to myRIO
f.writeBin(ctrl_path,ctrl_name{4},f.labviewRST(pitchSolo,rollSolo,yawSolo,'trio'));

