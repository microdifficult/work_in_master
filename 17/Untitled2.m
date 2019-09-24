clear all;
[fid,message]=fopen('chap17_5.m')
if fid==-1
    disp(message);
else
    while 1
        tline=fgets(fid);
        if ~ischar(tline)
            break;
        end
        disp(tline);
    end
    fclose(fid);
end