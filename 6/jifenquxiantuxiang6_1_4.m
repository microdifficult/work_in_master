clear all;
x=0:0.01:pi/2;
y=sin(x);
figure;
subplot(121)
plot(x,y,'b-')
hold on;
subplot(122)
fill(x,y,'r')