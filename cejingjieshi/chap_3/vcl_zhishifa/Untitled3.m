clear all;
clc;
f=@(p)p^2-4;
a=-10;
b=10;
h=0.01;
x=a;
ii=1;
while x<=b-h/2
if f(x)*f(x+h)<=0
    qujian=[x,x+h];
    continue;
else
    x=x+h;
end
ii=ii+1;
end