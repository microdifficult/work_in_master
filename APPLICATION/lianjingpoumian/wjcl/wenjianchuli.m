clc
clear all;
r1=input('load your file\n','s');
r2=input('type your save file\n','s');
[tops,bottoms,layers,result]=textread(r1,'%.2f %.2f %s %s');
data=[tops,bottoms];
data=data(:);
data=sort(data,'ascend');
p(2,:)=data;                %����������ݱ��������״����p�еڶ���
p=num2cell(p);
b=layers;
% b=textdata(:,3);
for i=1:size(b,1)
    a{1,i}=b{i};          %�ѷֲ�����ת���ɺ���ĵ�Ԫ����a
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
% end            %��ѷֲ�����aװ��p�е�һ�е���a��Ԫ�ؼ���һ���ո���װ��p�У���p��һ�и�ֵ������
% p


