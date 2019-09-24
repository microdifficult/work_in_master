
clc;

l=size(a,1);
yi=spline(1:l,[a';b';y'],1:0.1:l);      %目前只能用这种形式
% yi=spline(1:l,[a,b,y],1:0.1:l)
plot3(a,b,y,'ro',yi(1,:),yi(2,:),yi(3,:),'linewidth',1.5)