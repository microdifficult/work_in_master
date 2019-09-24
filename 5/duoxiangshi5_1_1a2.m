clear all;
p1=[4 3 2 1]
y=poly2sym(p1)
disp(y)
a=roots(p1)              %p存储多项式的系数向量%
p2=poly(a)              %y存储多项式 
y2=poly2sym(p2)         %a存储多项式的根
x=2:5
z=polyval(p1,x)
clear all;
a=10*rand(2,2)
b=1:5
c=polyval(b,a)
d=polyvalm(b,a)      %poly2syms() poly() disp() polyval() polyvalm() roots()%




