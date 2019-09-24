clear all;
close all;
[x,y,z]=sphere(40);
figure;
mesh(x,y,z);
hold on;
mesh(2*x,2*y,2*z);
colormap(jet);
hold off;
hidden off;
axis off