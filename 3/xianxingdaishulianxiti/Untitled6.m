clear all;
a=[3 1 1 1;
   1 3 1 1;
   1 1 3 1;
   1 1 1 3]
A=det(a)
clear all;
syms a b c d
e=[a b c d;
   a a+b a+b+c a+b+c+d;
   a 2*a+b 3*a+2*b+c 4*a+3*b+2*c+d;
   a 3*a+b 6*a+3*b+c 10*a+6*b+3*c+d]
f=det(e)
