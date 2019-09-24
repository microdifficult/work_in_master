clear all;
A=[1 3 4 5 6]
B=[4 7 8 9 3;
   linspace(2,9,5);
   linspace(3,10,5);
   linspace(1,7,5);
   linspace(7,9,5)]
C=linspace(1,8,5)
D=logspace(3,4,5)
a=A+C
b=C-D
c=A*B
d=B/C
f=3*B
g=A.^3
h=3.^A
e=dot(A,C)
