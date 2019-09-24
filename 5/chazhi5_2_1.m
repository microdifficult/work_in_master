clc
clear all;
x=0:0.2:2;
y=(x.^2-3*x+5).*exp(-3.*x).*sin(x);    %.^��.*���÷�%
xi=0:0.03:3;
yi_nearest=interp1(x,y,xi,'nearest',NaN);
yi_linear=interp1(x,y,xi,'linear','extrap');
yi_spine=interp1(x,y,xi,'spine','extrap');
yi_pchip=interp1(x,y,xi,'pchip','extrap');
yi_v5cubic=interp1(x,y,xi,'v5cubic',NaN);
figure;
hold on;
subplot(231);
plot(x,y,'ro');
title('��֪���ݵ�');
subplot(232);
plot(x,y,'ro',xi,yi_nearest,'b-');
title('�ڽ���ֵ');
subplot(233);
plot(x,y,'ro',xi,yi_linear,'b-');
title('���Բ�ֵ');
subplot(234);
plot(x,y,'ro',xi,yi_spine,'b-');
title('����������ֵ');
subplot(235);
plot(x,y,'ro',xi,yi_pchip,'b-');
title('�ֶ�����hermit��ֵ');
subplot(236);
plot(x,y,'ro',xi,yi_v5cubic,'b-');
title('���ζ���ʽ��ֵ');