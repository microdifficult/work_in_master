clc
clear all;
x=0:1.1:8
y=sin(x)
n=100000*length(x)
yi=interpft(y,n)
xi=0:(1.1/100000):8.7999999            %0.011为1.1/100
length(xi)
figure;
hold on;
plot(x,y,'ro',xi,yi,'b-');                 %快速傅里叶会由于采样点的影响引起漏采样
legend('原始数据','插值后结果')             %而造成plot函数不匹配，正确做法是，1确定n样点数，
                                            %2  根据步长算出上限值，求取不超过步长的最接近的数，
                                             %注意0也算一个点所以0:1.1:8.8为9个点
                                              %报错Vectors must be the same
                                              %%lengths.
                                             