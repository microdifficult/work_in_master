clear all;
clc
syms x y;
f=-0.25*y*exp(-2*x)+0.4*x*exp(-2*x)+3*exp(-2*x)
y1=collect(f,exp(-2*x))