clc
clear all;
syms x y z
f=log2(x^2-3*y+z)
g1=finverse(f,x)
g2=finverse(f,y)
g3=finverse(f,z)