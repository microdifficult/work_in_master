clear all
clc
[x,y,z,v]=flow(10);
[xi,yi,zi]=meshgrid(.1:.25:10,-3:.25:3,-3:.25:3);
vi=interp3(x,y,z,v,xi,yi,zi,'spline');
slice(xi,yi,zi,vi,[6 9],2,[-2 .2]);%��Ƭ��������ĳ�����ϵĺ���ֵ���ֳ���%
shading flat


