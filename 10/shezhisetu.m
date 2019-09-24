clear all;
close all;
[x,y,z]=peaks(40);
figure;
surf(x,y,z);
colormap(hsv);
caxis auto
v1=caxis
xlabel('x');
ylabel('y');
zlabel('z');
shading interp;