clc
clear all;
syms r z;
q=int(1/2*r^3/(((r^2+(z-1/2)^2)^(1.5))*((r^2+(z+1/2)^2)^(1.5))),r,0,inf)
% q=matlabFunction(q)
%  fplot(q,[-4,4])
 q=inline(q)
  fplot(q,[-4,4])
%   ezplot(q)

%���캯�����ã�1����������2�����������������




