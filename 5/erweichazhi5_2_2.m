clc
clear all;
[x,y]=meshgrid(-4:0.8:4);   %构造步长0.8的（-4,4）的网格
z=peaks(x,y)                %思想是利用peak函数创造已知z点后进行二维插值
[xi,yi]=meshgrid(-4:0.2:4);
zi_nearest=interp2(x,y,z,xi,yi,'nearest');
zi_linear=interp2(x,y,z,xi,yi);
zi_spline=interp2(x,y,z,xi,yi,'spline');
zi_cubic=interp2(x,y,z,xi,yi,'cubic');
figure;
hold on;
subplot(321);
surf(x,y,z);
title('原始数据');
subplot(322);
surf(xi,yi,zi_nearest);
title('临近插值');
subplot(323);
surf(xi,yi,zi_linear);
title('线性插值');
subplot(324);
surf(xi,yi,zi_spline);
title('三次样条插值');
subplot(325);
surf(xi,yi,zi_cubic);
title('三次多项式插值')
