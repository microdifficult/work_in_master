x=[ones(size(a,1)),a,b];
[b,bint,r,rint,stats]=regress(y,x)
figure;
rcoplot(r,rint)