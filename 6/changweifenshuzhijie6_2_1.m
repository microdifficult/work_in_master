clc
clear all;
options=odeset('reltol',1e-4,'abstol',[1e-4 1e-4 1e-5]);
[t,y]=ode45(@rigid,[0 50],[0 1 1],options)
figure;
plot(t,y(:,1),'-',t,y(:,2),'--',t,y(:,3),':');
legend('y1','y2','y3');
format short 