clc
clear all;
x=0:10;
y=sin(x);
xi=0:0.25:10;
yi=spline(x,y,xi)
pp=spline(x,y);
y1=ppval(pp,xi)
figure;
plot(x,y,'bo',xi,y1,'r-');

