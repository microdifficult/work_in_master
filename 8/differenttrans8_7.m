clc
clear all;
syms t v w x u n k z;
F1=fourier(1/t)
F2=fourier(exp(-x^2),x,t)
F3=fourier(exp(-t)*sym('heaviside(t)'),v)
F4=fourier(diff(sym('F(x)')),x,w)
F5=ifourier(fourier(sym('f(x)')))
F6=ifourier(v/1+w^2,v,u)
L1=laplace(1/t)
L2=laplace(exp(-x^2),x,t)
L3=laplace(exp(-t)*sym('heaviside(t)'),v)
L4=laplace(diff(sym('F(x)')),x,w)
L5=laplace(fourier(sym('f(x)')))
L6=laplace(v/1+w^2,v,u)
z1=ztrans(2^n)
z2=ztrans(sin(k*n),w)
z3=ztrans(cos(k*n),k,z)