%% 
% 
% 函数  fmincon  主要处理非线性约束条件问题
% 格式  x = fmincon(fun,x0,A,b)
% x = fmincon(fun,x0,A,b,Aeq,beq)
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon)
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
% [x,fval] = fmincon(…)
% [x,fval,exitflag] = fmincon(…)
% [x,fval,exitflag,output] = fmincon(…)
% [x,fval,exitflag,output,lambda] = fmincon(…)
% [x,fval,exitflag,output,lambda,grad] = fmincon(…)
% [x,fval,exitflag,output,lambda,grad,hessian] = fmincon(…)



%%
% 参数说明：fun为目标函数，它可用前面的方法定义；
% x0为初始值；fval为最后求的极值
% A、b满足线性不等式约束 ，若没有不等式约束，则取A=[ ]，b=[ ]；
% Aeq、beq满足等式约束 ，若没有，则取Aeq=[ ]，beq=[ ]；
% lb、ub满足 ，若没有界，可设lb=[ ]，ub=[ ]；
% nonlcon的作用是通过接受的向量x来计算非线性不等约束 和等式约束 分别在x处的估计C和Ceq，
%通过指定函数柄来使用，如：>>x = fmincon(@myfun,x0,A,b,Aeq,beq,lb,ub,@mycon)，先建立非线性约束函数，
%并保存为mycon.m：function [C,Ceq] = mycon(x)
% C = …
% % 计算x处的非线性不等约束 的函数值。
% Ceq = …
% % 计算x处的非线性等式约束 的函数值。
% lambda是Lagrange乘子，它体现哪一个约束有效。
% output输出优化信息；
% grad表示目标函数在x处的梯度；
% hessian表示目标函数在x处的Hessiab值


%%
%Trust region
%reflective（信赖域反射算法）、Activeset（有效集算法）、Interiorpoint（内点算法）、SQP(序列二次规划法)
%因为信赖域算法求解时要用到约束的hess矩阵，但是约束是线性的当然不能求解，所以系统推荐你使用active-set算法的线性搜索版本



%%
%非线性约束有条件标准形式   min f(x)
%                        sub to;  
%                                            非线性约束有条件有三个约束方式：1非线性不等约束条件与等式约束条件
%                                 C(x)<=0                                  2线性不等约束条件与等式约束条件
%                                 ceq(x)=0                                 3边界条件
%                                 A*x<=b
%                                 aeq*x=beq
%                                 lb<=x<=ub                        




%%
% 标准output表利用trust region reflective算法（信赖域反射算法）
%          iterations: 4                     迭代次数
%           funcCount: 12                    评价次数
%        lssteplength: 1                     是否设定步长1代表设定
%            stepsize: 3.7569e-008           最终步长大小
%           algorithm: 'medium-scale: SQP, Quasi-Newton, line-search'   算法
%       firstorderopt: 3.5086e-009           一阶优化度量：解x处梯度的范数，第一迭代值
%     constrviolation: 0
%             message: [1x788 char]

%%
clear all
clc
x0=[0.1 1 0.1 0.1];
A=[];
b=[];
aeq=[1 -1 -1 1;
   1 -1 1 -3;
   1 -1 -2 3];
beq=[0;1;-0.5];
lb=[];
ub=[];
options=optimset('Algorithm','sqp');
[x,fval,exitflag,output] =fmincon(@fun,x0,A,b,aeq,beq,lb,ub,[],options);

%output表如下
%          iterations: 23
%           funcCount: 194
%           algorithm: 'sequential quadratic programming'    序列二次规划法
%             message: [1x723 char]
%     constrviolation: 1.1102e-016
%            stepsize: 0.7000
%       firstorderopt: 4.5000









