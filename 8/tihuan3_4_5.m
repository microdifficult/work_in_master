clc
clear all;
syms x y
f=x^2-y^3;
g1=subs(f,'a',x)
g2=subs(f,y,5)
x='a';
subs(f)
g2=subs(exp(x*y),x,magic(4))