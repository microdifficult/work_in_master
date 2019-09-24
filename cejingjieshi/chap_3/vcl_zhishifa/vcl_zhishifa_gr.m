clear all;
load matlab.mat
gr_mm=input('grmax,grmin\n');
grmax=gr_mm(1);
grmin=gr_mm(2);
vsh=(gr-grmin)./(grmax-grmin);
vsh1=0:0.0001:0.6;

vcl1=0.083*(2.^(3.7*vsh)-1);
vcl11=0.083*(2.^(3.7*vsh1)-1);
subplot(231);
plot(vsh1,vcl11);
xlabel('vsh');
ylabel('vcl1');
legend('第三系碎屑岩');

vcl2=0.33*(2.^(2*vsh)-1);
vcl22=0.33*(2.^(2*vsh1)-1);
subplot(232);
plot(vsh1,vcl22);
xlabel('vsh');
ylabel('vcl2');
legend('压实好中生代岩石');

subplot(233);
plot(vsh1,vcl11,'--');
hold on;
plot(vsh1,vcl22,':');
legend('第三系碎屑岩','压实好中生代岩石');
xlabel('vsh');
ylabel('vcl');

subplot(234);
plot(vsh,dep);
xlabel('vsh');
subplot(235);
plot(vcl1,dep);
xlabel('vcl1');
subplot(236);
plot(vcl2,dep);
xlabel('vcl2');
