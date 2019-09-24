clc
clear all;
syms x;
a1=sym(magic(4))
a2=sym([1 2 3 4;
       2 2 3 4;
       3 2 3 4;
       4 2 3 4]);
a3=a1.*a2
a4=a1*a2
a5=a1./a2
a6=a1\a2