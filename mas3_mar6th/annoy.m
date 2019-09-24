clc
clear all;
syms t k;
func=@(t)exp(-t.*t);
flir=int(func,sqrt(200)*sec(k),100)*cos(k);
fli=@(k)(exp(200)/sqrt(pi)*(sqrt(200)*sec(k)*exp(-200*sec(k)*sec(k)))+flir);
s=-15*pi/180:30*pi/3600:15*pi/180;
% a=zeros(1,20001);
% a=int(fli,k,s(1),s(2));
 for  b=1:10
       a(b)=int(fli,k,s(b),s(b+1))
end
