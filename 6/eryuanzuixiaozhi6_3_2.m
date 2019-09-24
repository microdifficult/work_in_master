clc
clear all
[x,fval]=fminbnd(@cos,-0.01,pi+1)
clear all;
f=@(x)100*(x(2)-x(1)^2)^2+(1-x(1))^2;
[x,fval]=fminsearch(f,[-1.2 1])
