clear all;
clc
syms x;
f=dblquad(@(x,y) x*cos(y)+y*sin(x),pi,2*pi,0,pi)
f=triplequad(@(x,y,z) z*cos(y)+y*sin(x),0,pi,0,1,-1,1,1.e-10,@quadl)
