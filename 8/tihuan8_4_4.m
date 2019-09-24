clc
clear all;
syms x a
t=solve('a*x^3+a*x^2+3*x=0')
alpha=a;
[y1,alpha]=subexpr(t,alpha)