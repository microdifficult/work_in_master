clc
clear all;
d1=0:0.0125:2.5;
d3=0:0.0125:2.5;
theta=0:0.01*pi:2*pi;
rx=d3;
ry=1.7*cos(theta);
rz=1.7*sin(theta)+d1;
plot3(rx,ry,rz)