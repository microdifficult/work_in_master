function yy=myfun(beta,x)
x1=x(:,1);
x2=x(:,2);
yy=(x1.^beta(5)).*((1-beta(1).*(x2.^beta(2)+x2.^beta(3)).*exp(-x2))).^beta(4);