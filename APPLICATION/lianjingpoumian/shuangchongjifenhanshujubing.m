clc
clear all;
% syms x y;
% f1=@(x)x^2;
% f2=@(y)y^2;
% 
% % f4=dblquad(f3,-10,10,-10,10)
syms x y;
f3=@(x,y)x.^2*y.^2;
f3(1,2)
q=dblquad(f3,-10,10,-10,10) 
