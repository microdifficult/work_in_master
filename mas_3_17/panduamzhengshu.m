clear all;
a=[1,7,8,9,10];
for i=1:size(a,2)
    if a(i)/2==fix(a(i)/2)
       a(i)=0;
    end
end