clc
clear all;
syms x y
f=5*x^4+y*sin(x)+x*cos(y)+6
f1=diff(f,4,y)
clear all;
syms x y;
f=[5*x^4 y*sin(x);4*x x*cos(y)]

g2=jacobian(f,x)
clear all;
syms x h
y1=limit((cos(x+h)-cos(x-h))/h,h,0,'right')
