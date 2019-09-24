clc
clear all;
l=1;
[r,z]=meshgrid(-4:0.1:4)
dt=((r.^2+(z-l/2).^2).^(0.5))
dr=((r.^2+(z+l/2).^2).^(0.5))
g=0.5*(r.^3)./(dt.^3)./(dr.^3)    %������������ӦԪ�س˳��˷���Ҫ��".",��ʾ��ӦԪ�ص�����%
[ri,zi]=meshgrid(-4:0.05:4);            %����û�ӵ㱨��Matrix is singular to working precision.Warning: Matrix is close to singular or badly scaled.%
gi_spline=interp2(r,z,g,ri,zi,'spline');
figure;
surf(ri,zi,gi_spline);
title('˫��Ȧ��������gֵ�ֲ�');
xlabel('r');
ylabel('z');
zlabel('g');