clear all;
f1=@(a,b,c)@(x)a*x.^2+x.*b+c;
f2=f1(1,2,3);
f3=f2(2)
clear all;
f1=@(x)fzero(@(y)sin(x)*cos(y)+x*exp(y)-3*x^2*y^2,1);
f1(3)
f1(5)
clear all;
f1=@(a)quad(@(x)3*x.^2+a*x+5,0,1);
f1(3)
clear all;
f=@(x,y)3*x^2+4*y^2-sin(x)*sin(y);
figure;
ezmesh(f,[-1,1],[-1,1])
