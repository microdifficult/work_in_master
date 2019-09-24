clc
clear all;
[x,y]=meshgrid(-4:0.8:4);   %���첽��0.8�ģ�-4,4��������
z=peaks(x,y)                %˼��������peak����������֪z�����ж�ά��ֵ
[xi,yi]=meshgrid(-4:0.2:4);
zi_nearest=interp2(x,y,z,xi,yi,'nearest');
zi_linear=interp2(x,y,z,xi,yi);
zi_spline=interp2(x,y,z,xi,yi,'spline');
zi_cubic=interp2(x,y,z,xi,yi,'cubic');
figure;
hold on;
subplot(321);
surf(x,y,z);
title('ԭʼ����');
subplot(322);
surf(xi,yi,zi_nearest);
title('�ٽ���ֵ');
subplot(323);
surf(xi,yi,zi_linear);
title('���Բ�ֵ');
subplot(324);
surf(xi,yi,zi_spline);
title('����������ֵ');
subplot(325);
surf(xi,yi,zi_cubic);
title('���ζ���ʽ��ֵ')
