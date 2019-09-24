
clc
clear all;
t=-3*pi:0.0001*pi:3*pi;
alpha=5;
beta=2;
y=exp(-alpha*t).*sin(beta*t).*stepfun(t,0);
plot(t,y);
