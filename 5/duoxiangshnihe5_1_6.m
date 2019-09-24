clc
clear all;
x=[0.2 0.3 0.5 0.6 0.8 0.9 1.2 1.3 1.5 1.8]
y=[1 2 3 5 6 7 6 5 4 1]
p5=polyfit(x,y,5)  %��ϳ������Ƕ���ʽϵ������%
y5=polyval(p5,x)
p5=vpa(poly2sym(p5),5)  %vpa���ƾ���Ϊ5
p9=polyfit(x,y,9)
y9=polyval(p9,x)
figure;
plot(x,y,'bo')
hold on;
plot(x,y5,'r:');
plot(x,y9,'g--');
legend('ԭʼ����','��׶���ʽ���','�Ž׶���ʽ���');
xlabel('x');
ylabel('y')


