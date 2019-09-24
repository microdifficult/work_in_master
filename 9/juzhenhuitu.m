clear all;
x=-pi:pi/10:pi;
y=[sin(x);sin(x+1);sin(x+2)];
z=[cos(x);cos(x+1);cos(x+2)];
figure;
plot(x,y,'r:*',x,z,'g-.v')