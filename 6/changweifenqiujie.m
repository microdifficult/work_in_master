clear all;
clc
f1=dsolve('Dy-y=sin(x)','x')
f2=dsolve('Dy=a*y','y(0)=b')
f3=dsolve('D2y+2*Dy+exp(x)=0','x')