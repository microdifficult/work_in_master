clc
clear all
x=1:0.01:10;
y=exp(1).^(-3.*log(x)+5);
subplot(121);
plot(x,y);
subplot(122);
loglog(x,y);