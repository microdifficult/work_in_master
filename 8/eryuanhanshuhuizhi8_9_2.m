clc
clear all;
figure;
fplot('x^2-6*x+9*sin(x)+4',[-pi,pi]);
ezplot('x^2-6*x+9*sin(x)+4',[-pi,pi]);
clear all;
figure;
ezplot('x^2-5*y+3*x*y+4*y^2',[-3,1,-3,3])