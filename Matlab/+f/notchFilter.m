function filter = notchFilter(A,xsi,w0)
% filter = notchFilter(A,xsi,w0)
% notchFilter places notch filter of amplitude A (dB), and width xsi at w0
A = 10^(A/20);
s = tf('s');
u = (s^2+w0^2);
num = u^2+sqrt(2*A)*xsi*s*u+A*xsi^2*s^2;
den = A*(u^2+sqrt(2)*xsi*s*u+xsi^2*s^2);
filter = num/den*tf(A);
% figure();
% bodemag(filter)
end

