x=[0.5,0.4,0.3,0.2,0.1;0.3,0.5,0.2,0.4,0.6;1.8,1.4,1.0,1.4,1.8]';
y=[0.785,0.703,0.583,0.571,0.126]';  
beta0=[1,1,1,1,1]'; 
[beta,r,j]=nlinfit(x,y,@myfun1,beta0); 
