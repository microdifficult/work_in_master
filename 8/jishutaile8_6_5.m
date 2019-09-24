clc
clear all;
syms x k
y1=symsum(x+k^3-4*sin(x),k,1,5)
taylor(exp(x),5,1)
taylor(sin(x),5,1)