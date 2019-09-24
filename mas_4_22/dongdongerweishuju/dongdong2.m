clc
clear all
fid=fopen('l1.bin','r');
a=fread(fid,'float');
fid2=fopen('l2.bin','r');
b=fread(fid2,'float');
figure;
x=1:1000;
x=x';
plot(x,a);
hold on;
plot(x,b,'r');
fclose(fid);
fclose(fid2);
% set(gca,'ytick',0:300);    % 改y的坐标刻度
% set(gca,'xlim',[2000,2050]);  %改x轴的范围