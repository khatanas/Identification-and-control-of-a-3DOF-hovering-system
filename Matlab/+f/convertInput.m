function [output,D,Dinv] = convertInput(input)
% [output,D,Dinv] = convertInput(input)
% convertInput allows to get FBLR from pry or pry from FBLR:
%   - if input is [p,r,y]' then returns (Dinv*input)+u0
%   - if input is [F,B,L,R]' then returns D*(input-u0)

kp =1;kr=1;ky=1;u0=6;

% p = kp(F-B)
pi = kp*[1 -1 0 0];
% r = kr(L-R)
ri = kr*[0 0 1 -1];
% y = ky(-F-B+L+R)
yi = ky*[-1 -1 1 1];
D = [pi;ri;yi];
Dinv = pinv(D);

if length(input) == 3
    output = Dinv*input+6;
elseif length(input) == 4
    output = D*(input-6);
else 
    output = nan;
end

end

