clear all;
t=0:pi/20:6*pi;
r=5+cos(t);
[x,y,z]=cylinder(r,40);
figure;
subplot(221)
mesh(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');
subplot(222);
sphere(20);
subplot(223);
Z=peaks;
contour3(Z);
subplot(224);
contour(Z)

