a=rand(4,4)
b=rand(3,4)
A=cat(1,a,b)
B=vertcat(a,b)
c=rand(4,3)
C=horzcat(a,c)   %横着粘，但是叫做垂直连接%
D=cat(2,a,c)     %2是horz，1是vert%
E=repmat(c,2,2)  %进行块操作%
F=blkdiag(a,b,c) %形成对角阵% 
G=kron(b,c)
a([2 3],:)=[]
a(:,end)=[]
a3=a'
a4=ctranspose(a)
d=[i,2+9i,3-4i;  %转置%
   5,4+6i,9+8i]
d1=d.'
d2=transpose(d)  %旋转%
d3=rot90(d)
d4=rot90(d,3)
