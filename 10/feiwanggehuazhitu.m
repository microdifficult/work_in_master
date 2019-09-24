clc
clear all;
x=rand(1,100)*4-2;
y=rand(1,100)*4-2;
z=x.*exp(-x.^2-y.^2);              %创造网格数据但是不是均匀的网格化的数据
ti=-2:0.25:2;
[xi,yi]=meshgrid(ti)
figure;
zi=griddata(x,y,z,xi,yi,'cubic');
mesh(xi,yi,zi);
hold on;
plot3(x,y,z,'o');
hold off;
title('spline')

