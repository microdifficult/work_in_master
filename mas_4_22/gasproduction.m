function q=gasproduction(beta,x)%������ͳ��ģ�ͺ���
a=beta(1);
b=beta(2);
c=beta(3);
k=beta(4);
x1=x(:,2);%x1����������̶�ϵ����
x2=x(:,1);%x2�������Ǳ��Pg
q=a.*exp(k.*x1)+b.*x2+c;%ָ�������