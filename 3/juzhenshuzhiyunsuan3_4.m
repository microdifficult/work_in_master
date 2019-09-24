clear all;
a=[1 25 3;
   10 5 8;
   7 15 9]
b=find(a<5)
[i,j]=find(a>6)
c=a(find(a>6))
A=sort(a)
A1=sort(a,2)
A2=sort(a,'descend')
A3=sort(a,'ascend')
A4=sort(a,2,'ascend')
S=sum(a,2)
S1=sum(a)
S2=cumsum(a)
S3=sum(sum(a))
J=prod(a)
J1=prod(a,2)
J2=cumprod(a)
Y=diff(a)
Y1=diff(a,2)
Y2=diff(a,2,2)