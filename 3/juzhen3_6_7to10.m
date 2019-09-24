a=rand(4)
b=rand(4,3)
A=inv(a)
B=pinv(b)
A1=rank(a)
B1=rank(b)
A2=trace(a)
A3=norm(a,1)
A4=norm(a,inf)
t=cputime;
A5=norm(a,2)
t=cputime-t
A6=normest(a)
B2=normest(b)
A7=cond(a)
A8=rcond(a)

A9=orth(a)
C=A9'*A9

