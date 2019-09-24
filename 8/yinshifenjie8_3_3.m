clear all
clc
syms x y;
factor(x^4-y^4+x^2-y^2)
for i=1:8
    disp(factor(x^i-1))
end
