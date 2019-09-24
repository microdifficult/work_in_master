function q=gasproduction(beta,x)%产气量统计模型函数
a=beta(1);
b=beta(2);
c=beta(3);
k=beta(4);
x1=x(:,2);%x1代表拟解析程度系数β
x2=x(:,1);%x2代表产气潜力Pg
q=a.*exp(k.*x1)+b.*x2+c;%指数型拟合