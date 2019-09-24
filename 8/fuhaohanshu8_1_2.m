clear all;
clc
syms x y;
f1=4*(x-2)^2+sin(x+y)+5^x
f2=f1/(7*x)
f3=sym(f1/(7*x))
f4=sym('f1/(7*x)')