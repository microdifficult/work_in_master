clc
clear all;
swi=0.2;
sor=0.03;
sw=0:0.01:1;
s0=0:0.01:1;
krw1=((sw-swi)./(1-swi)).^3.5;
plot(sw,krw1,'r');

kr01=(1-(sw-swi)./(1-swi-sor)).^2.*(1-((sw-swi)./(1-swi-sor)).^1.5);
hold on
plot(sw,kr01);