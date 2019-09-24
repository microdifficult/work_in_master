clear all;
t=cputime;
for i=1:100000
    y(i)=exp(i);
end
t1=cputime-t