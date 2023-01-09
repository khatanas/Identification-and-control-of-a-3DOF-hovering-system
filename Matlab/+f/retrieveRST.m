function [Rtf, Sinvtf, Ttf] = retrieveRST(path,name,dt,operator)
% In the file computing the controller, the weights of each RST controller
% are stored in the folder "Retrieve".
% This function load the file [name] located in [path], and computes the
% corresponding discrete tf function for each R,S,T bloc. 
unbox = load([path name]);
unbox = getfield(unbox,name);
Rtf = tf(unbox{1},[1],dt,'variable',operator);
Sinvtf = tf([1],unbox{2},dt,'variable',operator);
Ttf =  tf(unbox{3},[1],dt,'variable',operator);
end

