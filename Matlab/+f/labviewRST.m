function K = labviewRST(in1,in2,in3,mode)
% K = labviewRST(in1,in2,in3,mode)
% If mode = 'solo', in1,in2,in3 are the R,S,T coefficients vectors for a 
% single axis. 
% => Returns partial controller input vector to LabVIEW. 
%
% If mode = 'trio', in1,in2,in3 are theLabVIEW controller input vector for
% pitch,roll,yaw.
% => returns global controller input vector to LabVIEW

if mode == 'solo'
    if length(in2) == 1
        in2 = [in2 0];
    end

    K = [length(in1) -in1 ...
        length(in2)-1 -in2(2:end) ...
        length(in3) in3];
end
if mode == 'trio'
    K = [length(in1) in1 ...
        length(in2) in2 ...
        length(in3) in3];
end
end

