function [g,ceq]=mycon2(x)
% g=[1.5+x(1)*x(2)-x(1)-x(2);-x(1)*x(2)-10];
g=[];
ceq=abs(x(1))+2*abs(x(2))+3*abs(x(3))+4*abs(x(4));
