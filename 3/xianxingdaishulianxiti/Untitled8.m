clear all;
syms a b c d 
x=eye(9)
y=fliplr(x)
A=a*x
B=b*y
C=c*x
D=d*y
A1=cat(2,A,B)
A2=cat(2,C,D)
A3=cat(1,A1,A2)
s=det(A3)
