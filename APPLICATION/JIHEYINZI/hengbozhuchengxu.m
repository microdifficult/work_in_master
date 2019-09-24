beta0=[1.15,1,3,1.5,1];
[beta,r,j,covb,mse]=nlinfit(x,y,@myfun,beta0)
