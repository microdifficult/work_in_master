clc
clear all;
syms x y
f1=(2*x^4-2*x)/(2*x^2+4*x+2)
sf1=simplify(f1)
f2=2*cos(x)^2-3*sin(x)^2-2;
sf2=simplify(f2,8)
sf3=simple(f2)
