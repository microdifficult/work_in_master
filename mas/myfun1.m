
function yy=myfun1(beta,x)
a=beta(1) 
b=beta(2) 
c=beta(3)
d=beta(4)
e=beta(5)
x1=x(:,1); 
x2=x(:,2);      
x3=x(:,3);  
yy=beta(1)+beta(2).*x2+beta(3).*x3+beta(4).*(x2.^2)+beta(5).*(x3.^2);  
