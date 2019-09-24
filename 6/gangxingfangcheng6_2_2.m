clear all;
clc
[t,y]=ode15s(@myfun2,[0,3000],[2,0])
figure;
subplot(121)
plot(t,y(:,1),'-o');
hold on;
subplot(122)
plot(t,y(:,2),'-o')