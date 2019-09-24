clear all;
clc
a=zeros(3,3,3);
a(1,2,3)=-1
a(find(a==min(min(min(a)))))
p=find(a-min(min(min(a)))<=10e-6);
[x,y,z]=ind2sub(size(a),p)