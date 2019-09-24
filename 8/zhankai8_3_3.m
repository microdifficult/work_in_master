clear all;
clc
syms x y
f1=(x-y)^2+(x+y)^3
g1=expand(f1)
g2=expand(sin(2*x)-sin(2*y))
g3=expand(exp(4*x^2-1))