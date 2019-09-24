%main程序，多元非线性拟合
clc
format long
x=[161.5,213.13,290.17,297.56;0.488,0.660,0.874,0.823]';
y=[1000,1500,2100,2200]';%典型井产气量
beta0=[0,100,0,-100]';
 [X,RESNORM,RESIDUAL,EXITFLAG,OUTPUT]=lsqcurvefit(@gasproduction,beta0,x,y)