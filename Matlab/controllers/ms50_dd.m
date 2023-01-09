%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PHILIPPE SCHUCHERT            %
% SCI-STI-AK, EPFL              %
% philippe.schuchert@epfl.ch    %
% March 2021                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Example use of the datadriven command
clc; close all; clear all
addpath('../')
addpath 'C:\Program Files\Mosek\10.0\toolbox\r2017a'
%%
% sampling time
Ts = 50;

% READ: load identified frd
store_path = '..\store\';
store_name = 'ms50-G-CL-fD1';
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
Gp = G0s(1,1);
K0p = R(1,1)*Sinv(1,1);
S0 = feedback(1,Gp*K0p);

% 
stab_order = order(K0p)      % initial order 
Fy = [1 -1];                 % fixed parts in denominator.
Fx = [1 1];                  % fixed parts in numerator.

% desired controller specfications
[num,den] = tfdata(K0p,'v'); % get numerator/denominator of PID controller
orderK = order(K0p) + 13      % desired order
den(orderK+1) = 0; % zero padding
num(orderK+1) = 0; % zero padding
den_new = deconv(den,Fy); % den = conv(den_new,Fy).
num_new = deconv(num,Fx); % num = conv(num_new,Fx).


% T0 = 1 - S0;
% 
% bodemag(Gp,S0,T0)
% legend('Gp','S0','T0')

%% Initial desired S, no cross-term info
% desired bandwidth
bwd = 10;

% high pass filter with 6 db after esired bw. add epsilon to avoid num
% issues
Sd = c2d(10^(6/20)*(s+epsilon)/(s+bwd),Ts);

% Sd = frd(Sd,fs); Sd.Ts = dt;

bodemag(S0,'--r',Sd,  G.Frequency(2:end))
legend('S0','Sd')

%% Filters for Pitch
% disturbances from Roll: ||S||<1/W1
Gpr = G(1,2);
wn_p = 2.21;
wn_r = 1.36;
%filter 1st peak
F1 = f.notchFilter(-20,0.8,wn_r);
%filter 2nd peak
F2 = f.notchFilter(-14,0.5,wn_p);

% only the first peak is a real disturbance from roll axis
Fpr = c2d(F1*F2,Ts);
figure()
bodemag(Gpr,'-r',Fpr*Gpr, G.Frequency(2:end))
title('Filtered disturbance')
legend('G_{pr}','F_{pr}*G_{pr}')
W1 = 1/(Sd*Fpr);

% optimize step responde ||T||<1/W2
W2 = 0.2*(s+epsilon); 
W2 = frd(W2,G.Frequency); W2.Ts = Ts;

% limit input ||U||<1/W3
maxIn = 3;
W3 = c2d(1/tf(maxIn),Ts);
% maxdB = 10;
% W3 = 1/tf(10^(maxdB/20));

bodemag(1/W1,1/W2,1/W3,  G.Frequency(2:end));
legend('S<1/W1','T<1/W2','U<1/W3')


%% dd opt init
[SYS, OBJ, CON, PAR] = datadriven.utils.emptyStruct(); % load empty structure
ctrl = struct('num',num_new,'den',den_new,'Ts',Ts,'Fx',Fx,'Fy',Fy); % assemble controller

SYS.controller = ctrl;
SYS.model = Gp; 
% fs = fs(fs <1/Ts*2*pi);
SYS.W = G.Frequency(2:end);
% SYS.W = datadriven.utils.logspace2(G.Frequency(2),G.Frequency(end),500); % specify frequency grid where problem is solved

% See different fields of OBJ
OBJ.oinf.W1 = W1;   % Minimize || W1 S ||_\infty 
% OBJ.oinf.W2 = W2;   % Minimize || W2 T ||_\infty 
OBJ.oinf.W3 = W3;   % Minimize || W3 U ||_\infty 
% OBJ.oinf.W4 = W4; % Only minimize || W4 V ||_\infty 

% %% Constraints(s)
% % See different fields of CON
% W4 =  1/c2d(makeweight(2,0.1*pi/Ts,0),Ts);
% CON.W2 = W2; % Only constraint || W2 T ||_\infty ≤ 1 

%% Solve problem
% See different fields of PAR
PAR.tol = 1e-4; % stop when change in objective < 1e-4. 
PAR.maxIter = 250; % max Number of iterations

tic
[controller,obj] = datadriven.datadriven(SYS,OBJ,CON,PAR,'fusion');
toc

Kdd = datadriven.utils.toTF(controller);
% Other solver can be used as last additional argument:
% [controller,obj] = datadriven(SYS,OBJ,CON,PAR,'sedumi'); to force YALMIP
% to use sedumi as solver.
% If mosek AND mosek Fusion are installed, you can use
% [controller,obj] = datadriven(SYS,OBJ,CON,PAR,'fusion');
% (much faster, no need for YALMIP as middle-man)

%% Analysis using optimal controller

S = feedback(1,Gp*Kdd);
T = 1-S;
U = feedback(Kdd,Gp*Kdd);
V = feedback(Gp,Gp*Kdd);

S0 = feedback(1,Gp*K0p);
T0 = 1-S0;
U0 = feedback(K0p,Gp*K0p);
V0 = feedback(Gp,Gp*K0p);
close all;

% ||S||<1/W1
figure(1)
subplot(221)
bodemag(S,S0,'--r',1/W1,'og', G.Frequency(2:end))
legend('Sdd','Sstab')

% ||U||<1/W3
subplot(222)
bodemag(U,U0,'--r',1/W3,'og',G.Frequency(2:end))
legend('Udd','Ustab')

subplot(223)
bodemag(V,V0,'--r', {G.Frequency(2),G.Frequency(end)})
legend('Vdd','Vstab')

subplot(224)
bodemag(T,T0,'--r',1/W2, 'og', {G.Frequency(2),G.Frequency(end)})
legend('Tdd','Tstab')

%%

% to q^-1
Den = (cell2mat(Kdd.Denominator));
Num = (cell2mat(Kdd.Numerator));
d = Kdd.OutputDelay;

Kexp = tf(Num,Den,Ts,'variable','q^-1','IODelay',d);
Kexp;
Rdd = Num; 
Sdd = Den;
Tdd = Num;

pitchSolo = f.labviewRST(Rdd,Sdd,Tdd,'solo');
f.labviewRST(pitchSolo,OL,OL,'trio');
f.writeBin(ctrl_path,ctrl_names{1},f.labviewRST(pitchSolo,OL,OL,'trio'));

%%
ylim([-20 10])
grid
legend('Initial $\mathcal{S}$','Final $\mathcal{S}$','$\mathcal{T}$','$\overline{W_2}^{-1}$','interpreter','LaTeX')
legend('Initial $\mathcal{S}$','Final $\mathcal{S}$','$\mathcal{T}$','$\overline{W_2}^{-1}$','interpreter','LaTeX')
% Need to plot legend two times (bug with MATLAB 2020).
shg

disp(['H2 computed using trapz integration: ', num2str(obj.H2)])
disp(['H2 true value: ', num2str(norm(minreal(S0*W1),2))])
% True H2 value not accessible when using the FRF