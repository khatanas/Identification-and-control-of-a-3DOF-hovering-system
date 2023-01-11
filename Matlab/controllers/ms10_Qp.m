%% Init
clear all;close all;clc
addpath('..\')

%% Edit zone %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% samplig time
Ts = 10;   % sampling time in CL (based on step response analysis)

% where to export controller 
ctrl_path = 'Z:\home\lvuser\khatanas\controlers\';
ctrl_name = {'pqp_10','rqp_10','yqp_10','pryqp_10'};

% where to store the discretized models and associated controllers
store_path = '..\store\';
file_Gds = 'ms10_Gs-disc-models-qp';
file_Ks = 'ms10_stabKqp';

%*************************************************************************%
Ts = Ts/1000;
T = 0:Ts:60;
s=tf('s');
z=tf('z',Ts);
OL = f.labviewRST(0,1,1,'solo');

%% Discretize model% load continuous time models
load([store_path 'Gs-cont-models-qp.mat'])
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
Gyd = Gd;

figure(); 
hold on;
plot(T,stepM);stairs(T,stepMd);title('Yaw')

% store
Gyd = c2d(Gy,Ts);
save([store_path file_Gds], 'Gyd','-append');
%% RST design
close all;clc
%*************************** PITCH ***************************************%
% desired poles
wn_pd = 2*sqrt(Gp.Denominator{1}(end));   % twice OL
xsi = 0.7;                                % increase damping
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
alpha = -0.1;
while length(P)<=Pmax
    Pf = [1 alpha];
    P = conv(P,Pf);
%     alpha = alpha+0.05;
end
Pp = P;

% get coeffs
[R0,S0] = f.generateRST(Ap,Bp,dp,P,Hr,Hs);

%% perform Q parametrization
clc;
nq = 20;
Q0 = ones(1,nq);
Mm = 0.5;
Uinf = 30;

dp = 0;
options = optimoptions('fmincon','MaxFunctionEvaluation',5e+3);

Qopt = fmincon(@(Q)objFun(Ap,Bp,dp,R0,S0,P,Hr,Hs,Q,Ts),Q0,...
    [],[],[],[],[],[],...
    @(Q)normConstr(Ap,Bp,dp,R0,S0,P,Hs,Hr,Q,Uinf,Mm,Ts),options);

% retrieve final Rcf,Scf,Tcf
[Rf,Sf,Tf] = f.generateRSTQp(Ap,Bp,dp,R0,S0,P,Hr,Hs,Qopt);
qpPitch = {Rf,Sf,Tf};

% store
save([store_path file_Ks],'qpPitch');
% export to myRIO
pitchSolo = f.labviewRST(Rf,Sf,Tf,'solo');
f.writeBin(ctrl_path,ctrl_name{1},f.labviewRST(pitchSolo,OL,OL,'trio'));

f.simulationQpPlot(Ap,Bp,dp,Rf,Sf,Tf,P,Ts,Uinf,Mm)
 %%
%*************************** ROLL ***************************************%
% desired poles
wn_rd = 2*sqrt(Gr.Denominator{1}(end));  % twice OL
xsi = 0.7;                               % increase damping
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
alpha = -0.1;
Pf = [1 alpha];

while length(P)<=Pmax
    P = conv(P,Pf);
end
Pr = P;

% get coeffs
[R0,S0,T0] = f.generateRST(Ar,Br,dr,P,Hr,Hs);
stabRoll = {R0,S0,T0};

%% perform Q parametrization
clc;
nq = 15;
Q0 = ones(1,nq);
Mm = 0.5;
Uinf = 25;

dr = 8;
options = optimoptions('fmincon','MaxFunctionEvaluation',5e+3);

Qopt = fmincon(@(Q)objFun(Ar,Br,dr,R0,S0,P,Hr,Hs,Q,Ts),Q0,...
    [],[],[],[],[],[],...
    @(Q)normConstr(Ar,Br,dr,R0,S0,P,Hs,Hr,Q,Uinf,Mm,Ts),options);

% retrieve final Rcf,Scf,Tcf
[Rf,Sf,Tf] = f.generateRSTQp(Ar,Br,dr,R0,S0,P,Hr,Hs,Qopt);
qpRoll = {Rf,Sf,Tf};

% store
save([store_path file_Ks],'qpRoll','-append');
% export to myRIO
rollSolo = f.labviewRST(Rf,Sf,Tf,'solo');
f.writeBin(ctrl_path,ctrl_name{2},f.labviewRST(OL,rollSolo,OL,'trio'));

f.simulationQpPlot(Ar,Br,dr,Rf,Sf,Tf,P,Ts,Uinf,Mm)
%%
%***************************** YAW ***************************************%
% desired poles
wn_rd = sqrt(Gp.Denominator{1}(end));   % same as pitch
xsi = 0.7;                              % increase damping
p1 = -2*exp(-xsi*wn_rd*Ts)*cos(wn_rd*Ts*sqrt(1-xsi^2));
p2 = exp(-2*xsi*wn_rd*Ts);
P = [1 p1 p2];
% rootsR = roots(P)
% p1 = -0.995;    % as slow as possible to not saturate output
% P = [1 p1];

% additionnal terms
Hs = [1 -1];
Hr = [1 1];

% get Pmax
[~, ~, ~, Pmax] = f.generateRST(Ay,By,dy,P,Hr,Hs);

% add auxiliary poles
alpha = -0.7;
% alpha = -0.5;
Pf = [1 alpha];

while length(P)<=Pmax
    P = conv(P,Pf);
end
Py = P;

% get coeffs
[R0,S0,T0] = f.generateRST(Ay,By,dy,P,Hr,Hs);
stabYaw = {R0,S0,T0};
%% perform Q parametrization
clc;
nq = 30;
Q0 = ones(1,nq);
Mm = 0.5;
Uinf = 30;

dy = 0;
options = optimoptions('fmincon','MaxFunctionEvaluation',5e+3);

Qopt = fmincon(@(Q)objFun(Ay,By,dy,R0,S0,P,Hr,Hs,Q,Ts),Q0,...
    [],[],[],[],[],[],...
    @(Q)normConstr(Ay,By,dy,R0,S0,P,Hs,Hr,Q,Uinf,Mm,Ts),options);

% retrieve final Rcf,Scf,Tcf
[Rf,Sf,Tf] = f.generateRSTQp(Ay,By,dy,R0,S0,P,Hr,Hs,Qopt);
qpYaw = {Rf,Sf,Tf};

% store
save([store_path file_Ks],'qpYaw','-append');
% export to myRIO
yawSolo = f.labviewRST(Rf,Sf,Tf,'solo');
f.writeBin(ctrl_path,ctrl_name{3},f.labviewRST(OL,OL,yawSolo,'trio'));

f.simulationQpPlot(Ay,By,dy,Rf,Sf,Tf,P,Ts,Uinf,Mm)


f.writeBin(ctrl_path,ctrl_name{4},f.labviewRST(pitchSolo,rollSolo,yawSolo,'trio'));
%% Ttest
load([store_path 'ms10_stabKqp.mat'])
load('..\store\ms10-ttraj');ttraj = 20*ttraj;
TT = (0:length(ttraj)-1)*Ts;
out_path = '..\data\';
out_folder = '2_test\pryqp_10\';
out_names = {'testp','testr','testy'};
nb = 13;

dp = 0;dr = 0;dy = 0;

% Pitch
channel = 1;
data = f.openBin([out_path out_folder],out_names{channel},nb);
sim = lsim(tf(conv(qpPitch{3},[zeros(1,dp) Gpd.Numerator{1}]),Pp,Ts,'variable','z^-1'),ttraj);
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
sim = lsim(tf(conv(qpRoll{3},[zeros(1,dr) Grd.Numerator{1}]),Pr,Ts,'variable','z^-1'),ttraj);
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
% speed = diff(data(:,channel))/Ts;
sim = lsim(tf(conv(qpYaw{3},[zeros(1,dy) Gyd.Numerator{1}]),Py,Ts,'variable','z^-1'),ttraj);
subplot(233);hold on
plot(TT,sim,'--r','Linewidth',1.5);
plot(TT,data(:,channel),'b');
% plot(TT,[speed ; speed(end)],'b');
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



%% Functions used for Q-parametrization
function [cost] = objFun(A,B,d,R0,S0,P,Hr,Hs,Q,Ts)

    Rq = f.generateRSTQp(A,B,d,R0,S0,P,Hr,Hs,Q);
   
% Cost function that minimizes the norm of U(jw)
    U = tf(conv(A, Rq), P,  Ts, 'variable', 'z^-1');
    % min |U(jw)|2
    cost = norm(U);
end


function [con1, con2] = normConstr(A,B,d,R0,S0,P,Hr,Hs,Q,Uinf,Mm,Ts)

    [Rq,Sq] = f.generateRSTQp(A,B,d,R0,S0,P,Hr,Hs,Q);
    
% Function that returns constraints on modulus margin and Infinite norm of U(jw)
    S = tf(conv(A, Sq), P,  Ts, 'variable', 'z^-1');
    U = tf(conv(A, Rq), P,  Ts, 'variable', 'z^-1');
    % |Mm*S(jw)| < 1
    con1 = norm(Mm*S, 'Inf') - 1;
    % |U(jw)| < U_UB
    con2 = norm(U, 'Inf') - Uinf;
end

