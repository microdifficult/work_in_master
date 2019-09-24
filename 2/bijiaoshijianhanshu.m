clear all;
t=clock
for i=1:1000
    y(i)=exp(i);
end
t1=etime(clock,t)
clear all;
t=clock
i=1:1000;
y(i)=exp(i);
t2=etime(clock,t)