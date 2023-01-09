function data = openBin(path,name,nb)
% Open the file 'name', located at 'path'. 
    fid = fopen([path name]);
    data = fread(fid,'double');
    data = reshape(data,nb,[])';
    fclose(fid);
end

