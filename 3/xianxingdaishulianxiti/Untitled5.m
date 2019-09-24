clear all;
a=magic(3)
det(a)
b=a(1,:)*3+a(2,:);
a(2,:)=b;
a
det(a)

