clc
clear all;
x=[0:0.01:5*pi];
y=cos(x./2)';
z=cumsum(y)*0.01
z1=z(end)
z2=trapz(x,y)
figure;
plot(x,y,'r-');
hold on;
plot(x,z,'b:')
legend('被积函数','积分曲线');

