clear all;
clc
load cnl_corr.mat;


%%
%����У��
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

% %1findѰ�ҵ�Ϊ�±꣬��ΪFIND(A==MIN(A))
% 2 Ѱ�ҵ�Ϊ����ֵ����Сֵ  
% 3cnl_corӦ������һ�������ж�����һ����
% 4ѭ���ܵõ��Ľ��Ϊһ������Ӧת�ô���


%%
%���У��
hmc=8.5*2.504-CAL;
cnl_corr2=(0.825^0.25).*(cnl_cor).*((hmc).^0.735).*(cnl_cor-0.225).*0.25+cnl_cor;    
scatter(cnl_cor,cnl_corr2);
%���=bit-cal��





%%
%�ཬ����У��
njbz=1.19


%%
%��϶У��





%%
%������У��





