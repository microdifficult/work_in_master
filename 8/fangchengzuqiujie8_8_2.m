clc
clear all;
syms a b x y;
f=solve('a*x+b*y-6=0','b*x+a*y-4=0','a','b')
f.a
f.b
clear all;
syms x y a b;
f=solve('a*x+y-6=0','5*x+a*y-4=0','4*x+6*y-8=0')
x=f.x
y=f.y
a=f.a
