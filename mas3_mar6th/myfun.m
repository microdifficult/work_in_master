function yy=myfun(beta,x)
x1=x(:,1);
yy=beta(1)+beta(2).*exp(beta(3).*x1/10^8);