clc
clear all;
x=-2:0.01:2.001;
subplot(121)
f=sin(x);
plot(x,f);
% f=inline()
g=diff(f)
subplot(122)
plot(x(1:end-1),g)
