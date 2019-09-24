function y = litcount(filename,literal)
fid = fopen(filename,'rt');
y=0;
while feof(fid)==0
      tline=fgetl(fid);
      matches=findstr(tline,literal);
      num=length(matches);
      if num>0
          y=y + num;
          fprintf(1,'%d:%s&#92;n',num,tline);
     end
end
fclose(fid);
