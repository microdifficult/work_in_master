
clear all;
clc
syms b e;
y=sqrt(int(cos(b)/(1+e^2*cos(b)^2),b,0,pi/2));
taylor(y,10)