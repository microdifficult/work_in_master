a=10*rand(4)
x=det(a)
b=6*rand(4,4)
y=det(b)
c=7*rand(4)
a(4,8)=0
A=cat(2,c,b)
B=vertcat(a,A)
z=det(B)
s=x*y