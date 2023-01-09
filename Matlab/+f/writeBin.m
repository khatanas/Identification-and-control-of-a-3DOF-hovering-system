function writeBin(path,name,toBin)
% writeBin(path,name,toBin)
% writeBin creates a binary file
fid = fopen([path name],'w');
fwrite(fid,toBin,'double');fclose(fid);
end

