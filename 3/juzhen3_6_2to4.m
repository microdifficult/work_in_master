a=[3 -1;
   -1 3]
A=eig(a)
[p,m]=eig(a)    %�Խǻ�����÷���inv(P)*A*P=M,MΪ��������ֵ�������Խ�Ԫ�صľ��ţ�pÿһ�ж�Ӧ��������%
clear all;
p=[3 5 2 1]
a=compan(p)
x1=eig(a)
x2=roots(p)
clear all;
a=rand(4)
b=diag(a)
c=diag(a,3)
d=triu(a)
e=tril(a)
