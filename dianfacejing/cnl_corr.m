clear all;
clc
load cnl_corr.mat;


%%
%井径校正
for i=1:size(a,1)
d1=4.75*2.5;
d2=6.25*2.5;
d3=7.875*2.5;
d4=9.875*2.5;
d5=12.25*2.5;
d6=14*2.5;
b=[abs(a(i,2)-d1),abs(a(i,2)-d2),abs(a(i,2)-d3),abs(a(i,2)-d4),abs(a(i,2)-d5),abs(a(i,2)-d6)];   
NOTE(i)=find(b==min(b));
if NOTE(i)==1
cnl_cor(i)=1.057*a(i,3)+3;
end
if NOTE(i)==2
cnl_cor(i)=1.054*a(i,3)+1.5;
end
if NOTE(i)==3
cnl_cor(i)=a(i,3);
end
if NOTE(i)==4
cnl_cor(i)=0.965*a(i,3)-1.667;
end
if NOTE(i)==5
cnl_cor(i)=0.925*a(i,3)-3.33;
end
if NOTE(i)==6
cnl_cor(i)=0.902*a(i,3)-4.286;
end
end
cnl_cor=cnl_cor';
cnl_cor=cnl_cor./100;
NOTE=NOTE';

% %1find寻找的为下标，且为FIND(A==MIN(A))
% 2 寻找的为绝对值得最小值  
% 3cnl_cor应存在于一个数组中而不是一个数
% 4循环管得到的结果为一行向量应转置处理


%%
%泥饼校正
hmc=8.5*2.504-CAL;
cnl_corr2=(0.825^0.25).*(cnl_cor).*((hmc).^0.735).*(cnl_cor-0.225).*0.25+cnl_cor;    
scatter(cnl_cor,cnl_corr2);
%泥饼=bit-cal；





%%
%泥浆比重校正
njbz=1.19


%%
%间隙校正





%%
%含盐量校正





