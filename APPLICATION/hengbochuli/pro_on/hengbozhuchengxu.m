% options = optimset(optimset,'MaxFunEvals',1000);
%%
  beta0=[1.15,1.5,3,1.5,1];
 [X,RESNORM,RESIDUAL,EXITFLAG,OUTPUT]=lsqcurvefit(@myfun,beta0,x,y);
% [BETA,R,J,COVB,MSE]=nlinfit(x,y,@myfun,beta0);
%%

  n=1;
 for w=1.56:0.00001:1.57
 beta0=[1.15,w,3,1.5,1];
 
 [X,RESNORM,RESIDUAL,EXITFLAG,OUTPUT]=lsqcurvefit(@myfun,beta0,x,y); 
                    C(n,:)=X;
                    B(n,:)=beta0;
                    A(n,:)=[B(n,:),C(n,:)];
                    n=n+1;
 end
%%

 n=1;  
for q=0.65:0.05:1.75                    %11
    for w=0.45:0.05:1.65                 %12
        for k=1.85:0.05:4.65            %28
            for l=1:0.05:2.5            %15
                for r=0.85:0.05:1.65    %8
                    beta0=[q,w,k,l,r];
                     [X,RESNORM,RESIDUAL,EXITFLAG,OUTPUT]=lsqcurvefit(@myfun,beta0,x,y); 
                     if isreal(X)
%                      if (X(1)>0.65&&X(1)<1.75)&&(X(2)>0.45&&X(2)<1.65)&&(X(3)>1.85&&(X(3)<4.65)&&(X(4)>1&&X(4)<2.5))&&(X(5)>0.85&&X(5)<1.65)
                     C(n,:)=X;
                     B(n,:)=beta0;
                     A(n,:)=[B(n,:),C(n,:)];
                     A(n,:)
                     n=n+1;
%                      end
                     end
                end
            end
        end
    end
end


