clc
clear all
uw=0.00101;
uo=1.499;
k=0:1:100000;
fw=1./(1+k.*(uw/uo));
figure;
plot(k,fw)
title('kw/k0¡ª¡ªfw¹ØÏµÍ¼');
xlabel('kw/k0');
ylabel('fw');
set(gca,'xtick',0:20000:100000)
