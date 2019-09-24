clc
clear all
load data.mat
den_fli=1.4;
dept=data(:,1);
cal=data(:,2);
gr=data(:,3);
A=[0.92,0.95,1,1.05];
di=[4.29,5.08,9.21,9.84];                                  %gr的环境影响校正：泥浆影响，井陉影响
B=[1,0.697];
bits=input('enter your bits\n');
cond=input('enter your well condition\n');
i=find(abs(bits-di)<1e-4);
grc=A(i).*gr.*exp(0.026.*B(cond).*(di(i)-cal)-0.3958);     %如果输入错误的井径值，由于i值寻找不到会造成报维度不匹配错


%%
p_kcl=input('kcl content percent');
a=grc./gr;
f=3.78-2.538*den_fli+0.4211*den_fli^2;
aa=-0.5536-2.1434*p_kcl+.01418*p_kcl^2;
bb=0.06738+0.2544*p_kcl-1.763*1e-3*p_kcl^2;                 %gr的kcl含量校正
cc=-7.875*1e-4-2.349*1e-3*p_kcl+1.64*1e-5*p_kcl^2;
g=aa+bb.*cal+cc.*cal.^2;
kcl=f.*g;
grcc=a.*(gr-kcl);
