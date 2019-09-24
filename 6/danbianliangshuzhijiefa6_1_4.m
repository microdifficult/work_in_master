clear all;
syms x;
f=inline('1./(sin(x)+exp(-x.^2))')
y=quad(f,0,1.3)
y1=quad(@myfun1,0,1.3)
y2=quad(@myfun1,0,1.3,1.e-10)
y3=quadl(f,0,1.3,1.e-20)