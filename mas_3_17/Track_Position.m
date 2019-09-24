Gdn0 = 4096e-6;
u=10;
DriverSeat=2.4;
seed=2;         
n=200;          
temp=sqrt(seed)-1;
random(1)=temp; 
for i=1:(n-1)
    temp=sqrt(temp);
    while temp<1
        temp=temp*10;
    end
    while temp>1
        temp=temp-1;
    end
    random(i+1)=temp;
    if temp==0
        break;
    end
end

n0=0.07;w1=2;f1=0.3;f2=28.3;N=200;df=(f2-f1)/N;m=5000;dt=0.07;  
for j=0:(m-1)
    temp1=0;
    for i=1:N
        f=f1+(i-0.5)*df;
        Gdf=(u.^(w1-1))*Gdn0*((f/n0).^(-w1));
        temp1=temp1+sqrt(2*Gdf*df)*sin(2*pi*(f*j*dt+random(i)));
    end
    t(j+1)=j*dt;
    y(j+1)=temp1;
end

for i=1:4:1000
    A=[y(i),y(i+1),y(i+2),y(i+3)];
    M1=max(A);M2=min(A);
   if M1==y(i)
       if M2==y(i+1)
           if (y(i)-y(i+2))/(0.32*2/3) > (y(i)-y(i+3))/0.32
               alpha(i)=atan((y(i)-y(i+3))/0.32);
           else
               alpha(i)=(y(i)-y(i+2))/(0.32*2/3);
           end
       end
       if M2==y(i+2)
           if y(i+3) > y(i+1)
              alpha(i)=atan((y(i)-y(i+3))/0.32);
           else
               alpha(i)=atan((y(i+1)-y(i+3))/(0.32*2/3));
           end
       end
       if M2==y(i+3)
           if y(i+2) > y(i+1)
              alpha(i)=atan((y(i)-y(i+2))/(0.32*2/3));
           else
              alpha(i)=atan((y(i+1)-y(i+2))/(0.32/3));
           end
       end
   end
   if M1==y(i+1)
       if M2==y(i)
           if y(i+2) > y(i+3)
               alpha(i)=atan((y(i+1)-y(i+2))/(0.32/3));
           else
               alpha(i)=atan((y(i+1)-y(i+3))/(0.32*2/3));
           end
       end
       if M2==y(i+2)
           alpha(i)=atan((y(i+1)-y(i+3))/(0.32*2/3));
       end
       if M2==y(i+3)
           alpha(i)=atan((y(i+1)-y(i+2))/(0.32/3));
       end
   end
   if M1==y(i+2)
       if M2==y(i)
           alpha(i)=atan((y(i+2)-y(i+1))/(0.32/3));
       end
       if M2==y(i+1)
           alpha(i)=atan((y(i+2)-y(i))/(0.32*2/3));
       end
       if M2==y(i+3)
           if y(i+1) > y(i)
             alpha(i)=atan((y(i+2)-y(i+1))/(0.32/3));  
           else
              alpha(i)=atan((y(i+2)-y(i))/(0.32*2/3));
           end
       end
   end
   if M1==y(i+3)
       if M2==y(i+2)
           if (y(i+3)-y(i+1))/(0.32*2/3) > (y(i+3)-y(i))/0.32 
               alpha(i)=atan((y(i+3)-y(i))/0.32);
           else
               alpha(i)=atan((y(i+3)-y(i+1))/(0.32/3));
           end
       end
       if M2==y(i+1)
           if y(i) > y(i+2)
              alpha(i)=atan((y(i+3)-y(i))/0.32); 
           else
              alpha(i)=atan((y(i+2)-y(i))/(0.32*2/3));
           end
       end
       if M2==y(i)
           if y(i+1) > y(i+2)
              alpha(i)=atan((y(i+3)-y(i+1))/(0.32*2/3)); 
           else
              alpha(i)=atan((y(i+2)-y(i+1))/(0.32/3));
           end
       end
   end
end
    