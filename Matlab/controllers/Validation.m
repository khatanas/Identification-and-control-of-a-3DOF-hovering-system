clear all; close all; clc
addpath('..\')

%% Ttest

load(['..\store\ms10_safeKqp']);
load(['..\store\ms10_Gs-disc-models-qp']);
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
sim = lsim(tf(conv(qpYaw{3},[zeros(1,dy) Gyd.Numerator{1}]),Py,Ts,'variable','z^-1'),ttraj);
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
