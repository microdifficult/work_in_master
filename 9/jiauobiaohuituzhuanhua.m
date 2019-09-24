clc
clear all;
theta=0:pi/40:4*pi;
rho=1+theta;
figure;
polar(theta,rho,'-r');
clear all;
theta=0:pi/40:4*pi;
rho=sin(theta);
figure;
subplot(211);
polar(theta,rho);
[x,y]=pol2cart(theta,rho)
subplot(212);
plot(x,y)
axis normal