clc
clear all;
r1=input('load your file\n','s');
r2=input('type your save file\n','s');
[tops,bottoms,layers,result]=textread(r1,'%.2f %.2f %s %s');
data=[tops,bottoms];
data=data(:);
data=sort(data,'ascend');
p(2,:)=data;                %处理深度数据变成理想形状存入p中第二行
p=num2cell(p);
b=layers;
% b=textdata(:,3);
for i=1:size(b,1)
    a{1,i}=b{i};          %把分层数据转换成横向的单元数组a
end
p(1,1:2:end)=a;
q{1,1}='wellid';
r1(end:-1:end-3)=nan;
q{2,1}=r1;
t=[q,p];
[success,message]=xlswrite(r2,t);
               
% for j=1:size(a,2)
% p{1,2*j-1}=a{1,j};
% p{1,2*j}=nan;
% end            %想把分层数据a装入p中第一行但是a中元素间有一个空格再装入p中，给p第一行赋值出问题
% p


