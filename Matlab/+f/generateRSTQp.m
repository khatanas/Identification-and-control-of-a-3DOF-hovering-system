function [R,S,T] = generateRSTQp(A,B,d,R0,S0,P,Hr,Hs,Q)
% [R,S,T] = generateRSTQp(A,B,d,R0,S0,P,Hr,Hs,Q)
% generateRSTQp computes R = R0+A*Hr*Hs*Q and S = S0-q^(-d)*B*Hs*Hr*Q

% add additional terms to Q
Q = conv(Hr,Q);
Q = conv(Hs,Q);

% add delay to B
B = [zeros(1,d) B];

% get final R,S
deltaR = length(R0)-length(conv(A,Q));
if deltaR<=0 % R0 smaller
    R = [R0 zeros(1,-deltaR)] + conv(A,Q);
else
    R = conv(A,Q) + [conv(A,Q) zeros(1,deltaR)];
end

deltaS = length(S0)-length(conv(B,Q));
if deltaS <=0  % S0 smaller
    S = [S0 zeros(1,-deltaS)] - conv(B,Q);
else 
    S = S0 - [conv(B,Q) zeros(1,deltaS)];
end

% compute T for same perf tracking/disturbance = P(1)/B(1)
T = sum(P)/sum(B);
end

