clear all;
clc
n=1:300;
x=n./(n+2);
figure;
subplot(121);   %subplot�����÷���121��ʾ��һ������λ�ڵ�һ������ͼ%
plot(n,x,'r-');
x1=1:200;
y1=(1+1./x1).^x1;
subplot(122)
plot(x1,y1,'r-')
