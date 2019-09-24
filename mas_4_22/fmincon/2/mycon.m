function [g,ceq]=mycon(x)
g=[1.5+x(1)*x(2)-x(1)-x(2);-x(1)*x(2)-10];
ceq=[];


%表示g<0，ceq=0,非线性约束条件