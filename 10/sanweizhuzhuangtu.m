clear all;
t=-pi:pi/40:pi;
x=sin(5*t);
y=cos(3*t);
z=t;
figure;
bar3(x,y,z)