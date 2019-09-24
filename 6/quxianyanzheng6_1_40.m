clear all;
x=0:0.01:1.3;
y=1./(sin(x)+exp(-x.^2));
figure;
subplot(121)
fill(x,y,'r')
hold on
subplot(122)
plot(x,y,'b')