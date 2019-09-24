clear all
clc
% load matlab.mat
load matlab2.mat
x=1:59;
plot(x,Aki_Richards,'kx');

hold on;
plot(x-0.5,Fatti,'r+');
hold on;
plot(x,Gray,'b*');
hold on;
plot(x+0.5,Shuey,'m--');
hold on;
plot(x,Zoeppritz,'g:');
hold on;
legend('Aki Richards','Fatti','Gray','Shuey','Zoeppritz');
