clc
clear all;
[X,Y]=meshgrid(-3:0.1:3);
Z=peaks(X,Y);
figure;
subplot(221);
meshc(X,Y,Z);
subplot(222);
meshz(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z');
subplot(223);
surfc(X,Y,Z);
subplot(224);
surfl(X',Y',Z');
