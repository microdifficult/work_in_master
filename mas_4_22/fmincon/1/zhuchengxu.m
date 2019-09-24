%% 
% 
% ����  fmincon  ��Ҫ���������Լ����������
% ��ʽ  x = fmincon(fun,x0,A,b)
% x = fmincon(fun,x0,A,b,Aeq,beq)
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon)
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
% [x,fval] = fmincon(��)
% [x,fval,exitflag] = fmincon(��)
% [x,fval,exitflag,output] = fmincon(��)
% [x,fval,exitflag,output,lambda] = fmincon(��)
% [x,fval,exitflag,output,lambda,grad] = fmincon(��)
% [x,fval,exitflag,output,lambda,grad,hessian] = fmincon(��)



%%
% ����˵����funΪĿ�꺯����������ǰ��ķ������壻
% x0Ϊ��ʼֵ��fvalΪ�����ļ�ֵ
% A��b�������Բ���ʽԼ�� ����û�в���ʽԼ������ȡA=[ ]��b=[ ]��
% Aeq��beq�����ʽԼ�� ����û�У���ȡAeq=[ ]��beq=[ ]��
% lb��ub���� ����û�н磬����lb=[ ]��ub=[ ]��
% nonlcon��������ͨ�����ܵ�����x����������Բ���Լ�� �͵�ʽԼ�� �ֱ���x���Ĺ���C��Ceq��
%ͨ��ָ����������ʹ�ã��磺>>x = fmincon(@myfun,x0,A,b,Aeq,beq,lb,ub,@mycon)���Ƚ���������Լ��������
%������Ϊmycon.m��function [C,Ceq] = mycon(x)
% C = ��
% % ����x���ķ����Բ���Լ�� �ĺ���ֵ��
% Ceq = ��
% % ����x���ķ����Ե�ʽԼ�� �ĺ���ֵ��
% lambda��Lagrange���ӣ���������һ��Լ����Ч��
% output����Ż���Ϣ��
% grad��ʾĿ�꺯����x�����ݶȣ�
% hessian��ʾĿ�꺯����x����Hessiabֵ


%%
%Trust region
%reflective�����������㷨����Activeset����Ч���㷨����Interiorpoint���ڵ��㷨����SQP(���ж��ι滮��)
%��Ϊ�������㷨���ʱҪ�õ�Լ����hess���󣬵���Լ�������Եĵ�Ȼ������⣬����ϵͳ�Ƽ���ʹ��active-set�㷨�����������汾



%%
%������Լ����������׼��ʽ   min f(x)
%                        sub to;  
%                                            ������Լ��������������Լ����ʽ��1�����Բ���Լ���������ʽԼ������
%                                 C(x)<=0                                  2���Բ���Լ���������ʽԼ������
%                                 ceq(x)=0                                 3�߽�����
%                                 A*x<=b
%                                 aeq*x=beq
%                                 lb<=x<=ub                        




%%
% ��׼output������trust region reflective�㷨�����������㷨��
%          iterations: 4                     ��������
%           funcCount: 12                    ���۴���
%        lssteplength: 1                     �Ƿ��趨����1�����趨
%            stepsize: 3.7569e-008           ���ղ�����С
%           algorithm: 'medium-scale: SQP, Quasi-Newton, line-search'   �㷨
%       firstorderopt: 3.5086e-009           һ���Ż���������x���ݶȵķ�������һ����ֵ
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

%output������
%          iterations: 23
%           funcCount: 194
%           algorithm: 'sequential quadratic programming'    ���ж��ι滮��
%             message: [1x723 char]
%     constrviolation: 1.1102e-016
%            stepsize: 0.7000
%       firstorderopt: 4.5000









