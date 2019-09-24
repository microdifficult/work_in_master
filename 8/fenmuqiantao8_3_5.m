clc
clear all;
syms x y;
f1=x^4+6^x^3+4*x^2-4;
g1=horner(f1)
f2=x/y+3*y/x;
[n,d]=numden(f2)