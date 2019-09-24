clc
clear all;
i=0:10;
j=0:10;
k=0:10;
[x,y]=meshgrid(i,j);
z=ones(11)*10;
z0=zeros(11);
surf(x,y,z);
hold on;
surf(x,y,z-10);
hold on;
surf(z,x,y);
hold on;
surf(z-10,x,y);
hold on;
surf(y,z,x);
hold on;
surf(y,z-10,x);