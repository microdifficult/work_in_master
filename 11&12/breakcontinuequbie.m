clear all;
x=magic(6);
for i=1:size(x,1)
    if rem(i,2)==0
        break;
    end
    x(i,:)=0;
end
x