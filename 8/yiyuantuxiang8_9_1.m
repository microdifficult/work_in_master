clc
clear all;
x=-2:0.1:4;
figure;
plot(x,humps(x));
title('plot0');
syms x;
y=humps(x);
figure;
fplot('humps(x)',[-2,4]);
clear all;
figure;
fplot('[1/x,sin(x),cos(x)]',2*pi*[-1 1 -1 1]);  %自变量范围写法很好%
legend('1/x','sin(x)','cos(x)')
clear all;
figure;
fplot('cos(1/x)',[0.01,0.1],0.001);