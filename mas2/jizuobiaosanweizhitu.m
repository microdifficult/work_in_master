clear all;
theta=0:pi/40:4*pi;
r=1+theta;
z=r.^2+r;
[x,y,z]=pol2cart(theta,r,z)
plot3(x,y,z)
