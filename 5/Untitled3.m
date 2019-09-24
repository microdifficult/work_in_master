clc
clear all;
syms q g r z;
g=r^2+z^2;
q=int(g,z,-inf,inf)