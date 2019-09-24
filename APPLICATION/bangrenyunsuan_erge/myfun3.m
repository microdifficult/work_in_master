function yy=myfun3(beta,x)
a=beta(1); 
b=beta(2);
x1=x(:,1); 
yy=((x1./beta(2)).^(beta(1)-1)).*exp(-x1./beta(2))./beta(2)./gamma(x)
% theta(x)=inv£¨e^(-t)*t^(x-1)£©dt 