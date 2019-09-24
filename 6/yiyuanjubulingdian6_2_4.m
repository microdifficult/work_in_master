clc
clear all;
f=@(x)sin(x)*cos(x);
figure;
fplot(f,[-5,5]);
xlabel('x');
ylabel('f(x)');
grid on;
x1=fzero(f,[-5,-4.3])
[x2,y2]=fzero(f,[-3,-1])