a=rand(4,4)
a1=flipud(a)
a2=fliplr(a)
a3=flipdim(a,1)
a4=flipdim(a,2)
b=reshape(a,1,16)
c=size(rand(2,8))
d=reshape(a,c)
e=length(d)
f=ndims(e)
