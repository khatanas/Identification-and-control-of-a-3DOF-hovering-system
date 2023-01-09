function [R,S,T,nPmax,Syl] = generateRST(A,B,d,Pd,Hr,Hs)
% [R,S,T,nPmax,Syl] = generateRST(A,B,d,Pd,Hr,Hs)
% generateRST returns controller for the plant (q^-d*B/A) with the 
% closed-loop characteristic polynomial `P`.
%`Hr` and `Hs` are fixed terms in the numerator and denominator, respectively. 
% T is computed for same tracking and regulation performances.
%
% All operators have to be row vectors. Returns row vectors
% A is of the form [1 a1 a2 ... aNA]
% B is of the form [0 b1 b2 ... bNB]
% d is a scalar

nA = length(A)-1;
nB = length(B)-1;
nHr = length(Hr)-1;
nHs = length(Hs)-1;
nP = length(Pd)-1;

% A*S+q^(-d)*Bbar*R = Pd
% => A*Hs*Sp+q^(-d)*Bbar*Hr*Rp = Pd
% => Ap*Sp+q^(-d)*Bp*Rp = Pd
Ap = conv(A,Hs);
Bp = conv(B,Hr);

nA = nA+nHs;
nB = nB+nHr;

nR = nA-1;
nS = nB+d-1;
nPmax = nA+nB+d-1;

% Sylvester matrix
n = nA+nB+d;
mA = nB+d;
mB = nA;

% Left part of Sylvester matrix
tmpL = [];
col0 = [Ap zeros(1,n-length(Ap))]';
for i=1:mA
    tmpL = [tmpL circshift(col0,i-1)];
end

% Right part of Sylvester matrix
tmpR = [];
coln = [zeros(1,n-length(Bp)) Bp]';
for i=1:mB
    tmpR = [circshift(coln,-(i-1)) tmpR];
end
Syl = [tmpL tmpR];

% Get coeffs
Pbar = [Pd zeros(1,n-length(Pd))]';
x = Syl\Pbar;
x = x(:)';

Sp = x(1:nS+1);
Rp = x(nS+2:end);

S = conv(Hs,Sp);
R = conv(Hr,Rp);

% Same dynamic: T = P(1)/B(1)
T = sum(Pd)/sum(B);
end
