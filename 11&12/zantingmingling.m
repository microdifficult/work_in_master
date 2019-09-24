clear all;
t=0:pi/20:2*pi;
x=sin(t);
figure;
plot(t,x);
xlabel('t');
ylabel('x');
hold on;
for i=1:7
    pause;
    plot(t,sin(t+i/5));
    hold on;
end
