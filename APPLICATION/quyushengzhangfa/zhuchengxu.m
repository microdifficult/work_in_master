clear all;
clc
I=10*rand(512);
I(6,10:30)=30;                     %Ҫ�����������Դ���ݱ���x��y�������5������������Ϊ0�Ŀ���
gray_mean=mean2(I);
for i=1:512
    for j=1:512
        if(I(i,j)>5*gray_mean)
            x_seed=i;
            y_seed=j;
           [Y,suit,sum,seed]=part_grow(I,x_seed,y_seed);
        end
    end
end
