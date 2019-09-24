




%%
%ÔËÐÐ´úÂë
clear;clc
x0=[-1;1];
A=[];b=[];
Aeq=[1 1];beq=[0];
vlb=[];vub=[];
[x,fval,exitflag,output]=fmincon('fun',x0,A,b,Aeq,beq,vlb,vub,'mycon')











