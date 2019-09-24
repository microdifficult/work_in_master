a=[3 -1;
   -1 3]
A=eig(a)
[p,m]=eig(a)    %对角化的最好方法inv(P)*A*P=M,M为所有特征值够成主对角元素的举着，p每一列对应特征向量%
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
