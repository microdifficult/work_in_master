clc
clear all;
pore=0.01:0.01:1;
m=1.87+0.019./pore;
F=1./(pore.^m);
loglog(F,pore);