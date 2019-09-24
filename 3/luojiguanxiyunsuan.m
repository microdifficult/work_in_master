clear all;
A=[1 3 5 7 9]
B=[4 9 8 7 3]
C=A>3
D=A==B
A(A>5)=7
B(B==7)=3
%返回值为逻辑值%
C=A&B
D=A|B
E=~A