clc
clear all;
syms x;
a1=sym(magic(4))
svd(a1)
svd(vpa(a1))