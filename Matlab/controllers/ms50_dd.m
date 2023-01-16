
clc; close all; clear all
addpath('../')
addpath 'C:\Program Files\Mosek\10.0\toolbox\r2017a'
%%
% sampling time
Ts = 50;

% READ: load identified frd
store_path = '..\store\';
store_name = 'ms50-G-OL-fD1';
G = getfield(load([store_path store_name]),'G');

%*************************************************************************%
% READ: location and file names for discretized model
store_path = '..\store\';
file_Gds = ['ms' int2str(Ts) '_Gs-disc-models'];
Gds = load([store_path file_Gds]);
names_Gds = {'Gpd','Grd','Gyd'};

% READ: location and file names for stabilizing controllers
file_K0 = 'ms50_stabK0';
K0 = load([store_path file_K0]);
names_K0 = {'stabPitch','stabRoll','stabYaw'};

% % WRITE: export path to labview and corresponding names
ctrl_path = 'Z:\home\lvuser\khatanas\controlers\';
ctrl_names = {'pdd_50','rdd_50','ydd_50','prydd_50'};

Ts = Ts/1000;
G.Ts = Ts;
namesIn = {'pitch_d','roll_d','yaw_d'}';
namesOut = {'pitch','roll','yaw'}';
s=tf('s');
z=tf('z',Ts);
epsilon = 1e-5;
OL = f.labviewRST(0,1,1,'solo');

%% Retrieve OL models, RST controllers
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

G0s = repmat(tf([1e-10],[1],Ts),[3,3]);
for i = 1:3
    G0s(i,i) = getfield(Gds, names_Gds{i});
end
G0s.InputName = namesIn;
G0s.OutputName = namesOut;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  PITCH  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;

% current system
Gp = G(1,1);
K0p = R(1,1)*Sinv(1,1);
S0 = feedback(1,Gp*K0p);

% fixed terms (MUST EXIST IN K0)
stab_order = order(K0p)      % initial order 
Fy = [1 -1];                 % fixed parts in denominator.
Fx = [1 1];                  % fixed parts in numerator.

% desired controller specfications
[num,den] = tfdata(K0p,'v'); % get numerator/denominator of PID controller
orderK = 50 %order(K0p) + 12      % desired order
den(orderK+1) = 0; % zero padding
num(orderK+1) = 0; % zero padding
den_new = deconv(den,Fy); % den = conv(den_new,Fy).
num_new = deconv(num,Fx); % num = conv(num_new,Fx).

%% Initial desired S, no cross-term info
close all;
% desired bandwidth
bwd = 4.45;

% high pass filter with 6 db after esired bw. add epsilon to avoid num
% issues
S1 = tf(1/(1/bwd*s+epsilon));
S2 = tf(1/bwd*s+1);
S3 = tf(0.5);
W1 = (S1*S2*S3);
W1 = c2d(W1,Ts,'Tustin');

bodemag(S0,'--r',1/W1, G.Frequency(2:end));
legend('S0','Sd')

%% Cross-term info on S
close all;
% disturbances from Roll: ||S||<1/W1
Gpr = G(1,2);
wn_p = 2.21;
wn_r = 1.36;
%filter 1st peak
F1 = f.notchFilter(-20,0.8,wn_r);
%filter 2nd peak
F2 = f.notchFilter(-14,2,wn_p);

% merge
Fpr = c2d(F1*F2,Ts,'Tustin');

% validation
figure()
bodemag(Gpr,Fpr,'--g',Fpr*Gpr, G.Frequency(2:end))
title('Filtered disturbance')
legend('G_{pr}','F_{pr}','F_{pr}*G_{pr}')
%% Final filters 
W1 = (S1*S2*S3);
W1 = c2d(W1,Ts,'Tustin');
W1 = W1/Fpr;

% optimize step response ||T||<1/W2
W2 = 0.25*(s+epsilon); 
W2 = frd(W2,G.Frequency); W2.Ts = Ts;

% limit input ||U||<1/W3 
% add notchF to help the optimizer
maxdB = 30;
W3 = 1/tf(...
    f.notchFilter(-maxdB,50,18)*...
    f.notchFilter(-maxdB-15,50,35)*...
    f.notchFilter(-maxdB-25,50,48)*...
    f.notchFilter(-maxdB-50,50,pi/Ts)*...
    10^(maxdB/20));

figure()
bodemag(1/W1,1/W2,1/W3,  G.Frequency(2:end));
legend('S<1/W1','T<1/W2','U<1/W3')
%% dd opt init
[SYS, OBJ, CON, PAR] = datadriven.utils.emptyStruct(); % load empty structure
ctrl = struct('num',num_new,'den',den_new,'Ts',Ts,'Fx',Fx,'Fy',Fy); % assemble controller

% SYS
SYS.controller = ctrl;
SYS.model = Gp; 
SYS.W = G.Frequency(2:end);

% OBJ
OBJ.oinf.W1 = W1;   % Minimize || W1 S ||_\infty 
OBJ.oinf.W2 = W2;   % Minimize || W2 T ||_\infty 
OBJ.oinf.W3 = W3;   % Minimize || W3 U ||_\infty 
% OBJ.oinf.W4 = W4;

%CON --

% PAR
PAR.tol = 1e-4; % stop when change in objective < 1e-4. 
PAR.maxIter = 250; % max Number of iterations
%% Solve problem
tic
[controller,obj] = datadriven.datadriven(SYS,OBJ,CON,PAR,'fusion');
toc

Kdd = datadriven.utils.toTF(controller);
%% Analysis using optimal controller
L = Gp*Kdd;

S = feedback(1,L);
T = 1-S;
U = feedback(Kdd,L);
V = feedback(Gp,L);

L0 = Gp*K0p;
S0 = feedback(1,L0);
T0 = 1-S0;
U0 = feedback(K0p,L0);
V0 = feedback(Gp,L0);
close all;

% ||S||<1/W1
figure(1)
subplot(221)
bodemag(S,S0,'--r',1/W1,'g', G.Frequency(2:end))
legend('Sdd','Sstab')

% ||U||<1/W3
subplot(222)
bodemag(U,U0,'--r',1/W3,'g',G.Frequency(2:end))
legend('Udd','Ustab')

subplot(223)
bodemag(V,V0,'--r', {G.Frequency(2),G.Frequency(end)})
legend('Vdd','Vstab')

subplot(224)
bodemag(T,T0,'--r',1/W2, 'g', {G.Frequency(2),G.Frequency(end)})
legend('Tdd','Tstab')

% to q^-1
Den = (cell2mat(Kdd.Denominator));
Num = (cell2mat(Kdd.Numerator));
d = Kdd.OutputDelay;

Rdd = Num; 
Sdd = Den;
Tdd = Num;

%% Compare with RST converted system
A0 = G0s(1,1).Denominator{1};
B0 = G0s(1,1).Numerator{1};
d = G0s(1,1).IODelay;
P = [conv(A0,Sdd) 0 0 0 0]+ conv([zeros(1,d),B0],Rdd);


f.simulationRSTPlot(A0,B0,d,Rdd,Sdd,Tdd,P,Ts);
% something's off, the plot of the CL system converted to RST does not
% match the results of the dd driven optimizer...

%% Export Solo

pitchSolo = f.labviewRST(Rdd,Sdd,Tdd,'solo');
f.writeBin(ctrl_path,ctrl_names{1},f.labviewRST(pitchSolo,OL,OL,'trio'));

%% Put stab controller in roll and yaw, as dd controller does not work...
stabRoll = getfield(load('..\store\ms50_stabK0.mat'),'stabRoll');
stabYaw = getfield(load('..\store\ms50_stabK0.mat'),'stabYaw');

rollSolo = f.labviewRST(stabRoll{1},stabRoll{2},stabRoll{3},'solo');
yawSolo = f.labviewRST(stabYaw{1},stabYaw{2},stabYaw{3},'solo');
f.writeBin(ctrl_path,'pdd_f_50',f.labviewRST(pitchSolo,rollSolo,yawSolo,'trio'));


%% TO BE UPDATED....
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ROLL  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;

% current system
Gr = G(2,2);
K0r = R(2,2)*Sinv(2,2);
S0 = feedback(1,Gr*K0p);

% fixed terms (MUST EXIST IN K0)
stab_order = order(K0r)      % initial order 
Fy = [1 -1];                 % fixed parts in denominator.
Fx = [1 1];                  % fixed parts in numerator.

% desired controller specfications
[num,den] = tfdata(K0r,'v'); % get numerator/denominator of PID controller
orderK = 50 %order(K0p) + 12      % desired order
den(orderK+1) = 0; % zero padding
num(orderK+1) = 0; % zero padding
den_new = deconv(den,Fy); % den = conv(den_new,Fy).
num_new = deconv(num,Fx); % num = conv(num_new,Fx).


% T0 = 1 - S0;
% 
% bodemag(Gp,S0,T0)
% legend('Gp','S0','T0')

%% Initial desired S, no cross-term info
close all;
% desired bandwidth
bwd = 5;

% high pass filter with 6 db after esired bw. add epsilon to avoid num
% issues
S1 = tf(1/(1/bwd*s+epsilon));
S2 = tf(1/bwd*s+1);
S3 = tf(0.5);
W1 = (S1*S2*S3);
W1 = c2d(W1,Ts,'Tustin');

bodemag(S0,'--r',1/W1, G.Frequency(2:end));
legend('S0','Sd')

%% Filters for Pitch
close all;
% disturbances from Roll: ||S||<1/W1
Grp = G(2,1);
wn_p = 2.21;
wn_r = 1.36;
%filter 1st peak
F1 = f.notchFilter(-20,0.8,wn_r);
%filter 2nd peak
F2 = f.notchFilter(-14,2,wn_p);

% only the first peak is a real disturbance from roll axis
Frp = c2d(F1*F2,Ts,'Tustin');

figure()
bodemag(Grp,Frp,'--g',Frp*Grp, G.Frequency(2:end))
title('Filtered disturbance')
legend('G_{pr}','F_{pr}','F_{pr}*G_{pr}')
%%
W1 = (S1*S2*S3);
W1 = c2d(W1,Ts,'Tustin');
W1 = W1/Fpr;

% optimize step responde ||T||<1/W2
W2 = 0.25*(s+epsilon); 
W2 = frd(W2,G.Frequency); W2.Ts = Ts;

% limit input ||U||<1/W3
% maxIn = 3;
% W3 = c2d(1/tf(maxIn),Ts);
maxdB = 30;
W3 = 1/tf(f.notchFilter(-maxdB,50,18)*f.notchFilter(-maxdB-15,50,35)*f.notchFilter(-maxdB-25,50,48)*f.notchFilter(-maxdB-50,50,pi/Ts)*10^(maxdB/20));

figure()
bodemag(1/W1,1/W2,1/W3,  G.Frequency(2:end));
legend('S<1/W1','T<1/W2','U<1/W3')


%% dd opt init
[SYS, OBJ, CON, PAR] = datadriven.utils.emptyStruct(); % load empty structure
ctrl = struct('num',num_new,'den',den_new,'Ts',Ts,'Fx',Fx,'Fy',Fy); % assemble controller

% SYS
SYS.controller = ctrl;
SYS.model = Gr; 
SYS.W = G.Frequency(2:end);

% OBJ
OBJ.oinf.W1 = W1;   % Minimize || W1 S ||_\infty 
OBJ.oinf.W2 = W2;   % Minimize || W2 T ||_\infty 
OBJ.oinf.W3 = W3;   % Minimize || W3 U ||_\infty 
% OBJ.oinf.W4 = W4;

%CON --

% PAR
PAR.tol = 1e-4; % stop when change in objective < 1e-4. 
PAR.maxIter = 250; % max Number of iterations
%% Solve problem
tic
[controller,obj] = datadriven.datadriven(SYS,OBJ,CON,PAR,'fusion');
toc

Kdd = datadriven.utils.toTF(controller);
%% Analysis using optimal controller
L = Gr*Kdd;

S = feedback(1,L);
T = 1-S;
U = feedback(Kdd,L);
V = feedback(Gr,L);

L0 = Gr*K0r;
S0 = feedback(1,L0);
T0 = 1-S0;
U0 = feedback(K0r,L0);
V0 = feedback(Gr,L0);
close all;

% ||S||<1/W1
figure(1)
subplot(221)
bodemag(S,S0,'--r',1/W1,'g', G.Frequency(2:end))
legend('Sdd','Sstab')

% ||U||<1/W3
subplot(222)
bodemag(U,U0,'--r',1/W3,'g',G.Frequency(2:end))
legend('Udd','Ustab')

subplot(223)
bodemag(V,V0,'--r', {G.Frequency(2),G.Frequency(end)})
legend('Vdd','Vstab')

subplot(224)
bodemag(T,T0,'--r',1/W2, 'g', {G.Frequency(2),G.Frequency(end)})
legend('Tdd','Tstab')

% to q^-1
Den = (cell2mat(Kdd.Denominator));
Num = (cell2mat(Kdd.Numerator));
d = Kdd.OutputDelay;

Rdd = Num; 
Sdd = Den;
Tdd = Num;

rollSolo = f.labviewRST(Rdd,Sdd,Tdd,'solo');
f.writeBin(ctrl_path,ctrl_names{2},f.labviewRST(OL,rollSolo,OL,'trio'));


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  YAW  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;

% current system
Gy = G(3,3);
K0y = R(3,3)*Sinv(3,3);
S0 = feedback(1,Gy*K0y);

% fixed terms (MUST EXIST IN K0)
stab_order = order(K0y)      % initial order 
Fy = [1 -1];                 % fixed parts in denominator.
Fx = [1 1];                  % fixed parts in numerator.

% desired controller specfications
[num,den] = tfdata(K0y,'v'); % get numerator/denominator of PID controller
orderK = 50 %order(K0p) + 12      % desired order
den(orderK+1) = 0; % zero padding
num(orderK+1) = 0; % zero padding
den_new = deconv(den,Fy); % den = conv(den_new,Fy).
num_new = deconv(num,Fx); % num = conv(num_new,Fx).


% T0 = 1 - S0;
% 
% bodemag(Gp,S0,T0)
% legend('Gp','S0','T0')

%% Initial desired S, no cross-term info
close all;
% desired bandwidth
bwd = 30;

% high pass filter with 6 db after esired bw. add epsilon to avoid num
% issues
S1 = tf(1/(1/bwd*s+epsilon));
S2 = tf(1/bwd*s+1);
S3 = tf(0.5);
W1 = (S1*S2*S3);
W1 = c2d(W1,Ts,'Tustin');

bodemag(S0,'--r',1/W1, G.Frequency(2:end));
legend('S0','Sd')

%% Filters for YAW
close all;

% optimize step responde ||T||<1/W2
W2 = 0.25*(s+epsilon); 
W2 = frd(W2,G.Frequency); W2.Ts = Ts;

% limit input ||U||<1/W3
% maxIn = 3;
% W3 = c2d(1/tf(maxIn),Ts);
maxdB = 5;
W3 = 1/tf(10^(maxdB/20));

% disturbances from pitch/roll: ||V||<1/W4
bodemag(G(3,1),G(3,2),G(3,3))
maxdB = - 30;
W4 = 1/tf(f.notchFilter(maxdB,5,8)*10^(maxdB/20));

figure()
bodemag(1/W1,1/W2,1/W3,1/W4 ,  G.Frequency(2:end));
legend('S<1/W1','T<1/W2','U<1/W3','V<1/W4')


%% dd opt init
[SYS, OBJ, CON, PAR] = datadriven.utils.emptyStruct(); % load empty structure
ctrl = struct('num',num_new,'den',den_new,'Ts',Ts,'Fx',Fx,'Fy',Fy); % assemble controller

SYS.controller = ctrl;
SYS.model = Gr; 
SYS.W = G.Frequency(2:end);

% See different fields of OBJ
OBJ.oinf.W1 = W1;   % Minimize || W1 S ||_\infty 
OBJ.oinf.W2 = W2;   % Minimize || W2 T ||_\infty 
OBJ.oinf.W3 = W3;   % Minimize || W3 U ||_\infty 
OBJ.oinf.W4 = W4;

% See different fields of PAR
PAR.tol = 1e-4; % stop when change in objective < 1e-4. 
PAR.maxIter = 250; % max Number of iterations
%% Solve problem
tic
[controller,obj] = datadriven.datadriven(SYS,OBJ,CON,PAR,'fusion');
toc

Kdd = datadriven.utils.toTF(controller);
%% Analysis using optimal controller

S = feedback(1,Gr*Kdd);
T = 1-S;
U = feedback(Kdd,Gr*Kdd);
V = feedback(Gp,Gr*Kdd);

S0 = feedback(1,Gr*K0r);
T0 = 1-S0;
U0 = feedback(K0r,Gr*K0r);
V0 = feedback(Gr,Gr*K0r);
close all;

% ||S||<1/W1
figure(1)
subplot(221)
bodemag(S,S0,'--r',1/W1,'g', G.Frequency(2:end))
legend('Sdd','Sstab')

% ||U||<1/W3
subplot(222)
bodemag(U,U0,'--r',1/W3,'g',G.Frequency(2:end))
legend('Udd','Ustab')

subplot(223)
bodemag(V,V0,'--r',1/W4,'g', {G.Frequency(2),G.Frequency(end)})
legend('Vdd','Vstab')

subplot(224)
bodemag(T,T0,'--r',1/W2, 'g', {G.Frequency(2),G.Frequency(end)})
legend('Tdd','Tstab')

% to q^-1
Den = (cell2mat(Kdd.Denominator));
Num = (cell2mat(Kdd.Numerator));
d = Kdd.OutputDelay;

Kexp = tf(Num,Den,Ts,'variable','q^-1','IODelay',d);
Kexp;
Rdd = Num; 
Sdd = Den;
Tdd = sum(Rdd);

yawSolo = f.labviewRST(Rdd,Sdd,Tdd,'solo');
f.writeBin(ctrl_path,ctrl_names{3},f.labviewRST(OL,OL,yawSolo,'trio'));
f.writeBin(ctrl_path,ctrl_names{4},f.labviewRST(pitchSolo,rollSolo,yawSolo,'trio'));







