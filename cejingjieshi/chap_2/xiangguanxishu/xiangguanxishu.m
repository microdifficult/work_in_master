clear all;
clc
load matlab.mat
t=-160:160;
k=160;
for n=20:10:50            %窗长设不同值
s1=0;s2=0;s3=0;
for i=k+1:k+n
a=(x(i)-mean(x))*(y(i+t)-mean(y));
s1=s1+a;
end

for i=k+1:k+n
    b=(x(i)-mean(x))^2;
    s2=s2+b;
    c=(y(i+t)-mean(y)).^2;
    s3=s3+c;
end

d=s1./sqrt(s2.*s3);
plot(t,d);
hold on
end