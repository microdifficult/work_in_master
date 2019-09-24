clear all;
clc

x=linspace(6,21,16);
y=[205,213,187,209,198,231,203,189,192,211,235,278,207,178,146,107];
xx=6:0.125:21;
yy=spline(x,y,xx);
figure;
plot(x,y,'ro',xx,yy)