function [Y,suit,sum,seed]=part_grow(I,x_seed,y_seed)  
count=1;
seed=I(x_seed,y_seed);
Y=zeros(512,512);              %%%%%%%������ǰ����Y�Ĵ�С��������г�����Χ�ķ���
Y(x_seed,y_seed)=1;
threshold=0.05;
sum=seed;               %��������������������ĵ�ĻҶ�ֵ�ĺ�
suit=1;   
while count>0
 s=0;                    %��¼�ж�һ����Χ�˵�ʱ�������������µ�ĻҶ�ֵ֮��
 count=0; 
 for i=(x_seed-5):(x_seed+5)
   for j=(y_seed-5):(y_seed+5)
     if i>(x_seed-6) && i<(x_seed+6) && j>(y_seed-6) && j<(y_seed+6)
 %�жϴ˵��Ƿ�Ϊͼ��߽��ϵĵ�
      if Y(i,j)==1
       for u=-1:1                                %�жϵ���Χ�˵��Ƿ�Ϻ���ֵ����
        for v=-1:1                               %u,vΪƫ����
          if  Y(i+u,j+v)==0 &&abs(I(i+u,j+v)-seed)<=threshold&& 1/(1+1/15*abs(I(i+u,j+v)-seed))>0.8
%�ж��Ƿ�δ�������������Y������Ϊ������ֵ�����ĵ�
             Y(i+u,j+v)=1;            %����������������������Y����֮λ�ö�Ӧ�ĵ�����Ϊ�׳�
              seed=I(i+u,j+v);
             count=count+1;                 %�˴�ѭ���µ�����1
             s=s+I(i+u,j+v);  %�˵�ĻҶ�֮����s
          end
        end  
       end
      end
     end
   end
  end
  suit=suit+count;                         %��n������ϵ�����������
  sum=sum+s;                           %��s������ϵ�ĻҶ�ֵ�ܺ���
  seed=sum/suit;                          %�����µĻҶ�ƽ��ֵ
end
end
%%%%%function�����ڸ���end��ʹfuctionҲ�����ߵ�����