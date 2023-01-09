function simulationPlot(A,B,d,R0,S0,Uinf,Mm,R,S,T,P,dt)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
Tp = 0:dt:10;
B = [zeros(1,d) B];

% output/ref : y/r = q^-d*B*T/P
yor = tf(conv(T,B),P,dt,'variable','z^-1');
YoR = step(yor,Tp);

% output/input disturbance : y/v = A*S/P
S = tf(conv(S,A),P,dt,'variable','z^-1');
YoV = step(S,Tp);

% input/ref : u/r = A*T/P
uor = tf(conv(T,A),P,dt,'variable','z^-1');
UoR = step(uor,Tp);

% input/input disturbance : u/v = A*R/P
U0 = tf(conv(R0,A),P,dt,'variable','z^-1');
UoV0 = step(U0,Tp);
U = tf(conv(R,A),P,dt,'variable','z^-1');
UoV = step(U,Tp);

% convert inputs to motor commands
rpyV = [UoV zeros(length(Tp),1) zeros(length(Tp),1)]';
rpyR = [UoR zeros(length(Tp),1) zeros(length(Tp),1)]';
UoR_mot = [];
UoV_mot = [];
for i=1:length(Tp)
    UoR_mot = [UoR_mot f.convertInput(rpyR(:,i))];
    UoV_mot = [UoV_mot f.convertInput(rpyV(:,i))];
end
UoR_mot = UoR_mot'+6;
UoV_mot = UoV_mot'+6;

figure(3)
subplot(3,2,1); plot(Tp,YoR);title('YoR')
subplot(3,2,2); plot(Tp,YoV);title('S');grid on;
subplot(3,2,3); plot(Tp,UoR);title('UoR')
subplot(3,2,4); plot(Tp,UoV);title('U')
subplot(3,2,5); hold on; plot(Tp,UoR_mot);title('UoR motor')
yline(12,'--r');yline(0,'--r');axis tight; hold off
subplot(3,2,6); hold on; plot(Tp,UoV_mot);title('UoV motor')
yline(12,'--r');yline(0,'--r');axis tight; hold off

figure(4)
subplot(2,2,1)
bodemag(yor);title('YoR')
subplot(2,2,2)
bodemag(S,tf(1/Mm),'--r');title('S')
subplot(2,2,3)
bodemag(uor);title('UoR')
subplot(2,2,4)
bodemag(U,U0,'--y',tf(10^(Uinf/20)),'--r');title('U')
end

