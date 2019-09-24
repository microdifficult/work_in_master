syms x;
a1=sym(magic(4))
e1=eig(a1)
[v1,d1]=eig(a1)
clear all;
a=sym([1 2 1; 1 2 1;3 1 1])
[v j]=jordan(a)
v1=vpa(v,8)
j1=vpa(j,8)
j2=vpa(v\a*v,8)