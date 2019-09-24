clear all;
clc
x=[0:pi/100:pi];
y=sin(x);
s=sum((2*y(1:end-1)+diff(y)).*diff(x))/2