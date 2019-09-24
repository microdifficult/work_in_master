clear all;
clc
figure;
ezmeshc('x.*exp(-x).*cos(y)');
figure
ezmesh('x.*exp(-x^2-y^2)');
figure;
ezmeshc('cos(t)','t*sin(t)','sqrt(t)+s');