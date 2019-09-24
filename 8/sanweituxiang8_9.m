clc
clear all;
figure;
ezcontour('x.*exp(-x.^2-y.^2)',[-3,3]);
figure;
ezcontourf('x.*exp(-x.^2-y.^2)',[-3,3]);
figure;
ezsurf('x.*y.^2/(x.^2+y.^4)');
figure;
ezsurfc('s*sin(t)','cos(t)*s','t')