clear all;
fid=fopen('123.txt','r+');
a=fread(fid,[4,4]);
fwrite(fid,'i can see your cry');
fclose(fid);