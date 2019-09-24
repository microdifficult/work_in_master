clear all;
clc
I=10*rand(512);
I(6,10:30)=30;
Y(512,512)=0;
gray_mean=mean2(I);
for i=1:512
    for j=1:512
        if(I(i,j)>5*gray_mean)
            x_seed=i;
            y_seed=j;
            Y(x_seed,y_seed)=1;
count=1;
seed=I(x_seed,y_seed);

threshold=0.05;
sum=seed;               %储存符合区域生长条件的点的灰度值的和
suit=1;   
while count>0
 s=0;                    %记录判断一点周围八点时，符合条件的新点的灰度值之和
 count=0; 
 for i=(x_seed-5):(x_seed+5)
   for j=(y_seed-5):(y_seed+5)
     if i>(x_seed-6) && i<(x_seed+6) && j>(y_seed-6) && j<(y_seed+6)
 %判断此点是否为图像边界上的点
     if Y(i,j)==1
       for u=-1:1                                %判断点周围八点是否合和域值条件
        for v=-1:1                               %u,v为偏移量
          if  Y(i+u,j+v)==0 &&abs(I(i+u,j+v)-seed)<=threshold&& 1/(1+1/15*abs(I(i+u,j+v)-seed))>0.8
%判断是否未存在于输出矩阵Y，并且为符合域值条件的点
             Y(i+u,j+v)=1;            %符合以上两条件即将其在Y中与之位置对应的点设置为白场
              seed=I(i+u,j+v);
             count=count+1;                 %此次循环新点数增1
             s=s+I(i+u,j+v);  %此点的灰度之加入s
          end
        end  
       end
      end
     end
   end
  end
  suit=suit+count;                         %将n加入符合点数计数器中
  sum=sum+s;                           %将s加入符合点的灰度值总合中
  seed=sum/suit;                          %计算新的灰度平均值
end
      
            
  
        end
    end
end
