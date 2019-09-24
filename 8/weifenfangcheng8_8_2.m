clc
clear all;
syms x t;
f=dsolve('Dx=-a*x')
clear all;
syms x y t;
f=dsolve('D2y=-a^2*y','y(0)=1','y(pi)=1')
f1=dsolve('D2y+2*Dy+2*y=0','x')
clear all;
syms x t y
e1=dsolve('Dx=y','Dy=-x')
clear all;
syms u t v w;
[u,t,w]=dsolve('Du=v','Dv=w','Dw=-u')