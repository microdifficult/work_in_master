clc
clear all;
r=8.314;
t=273.15+18;
f=96500;
l_p1=4.35;         %%NaClÈÜÒº
l_p2=5.16;           %%cacl2ÈÜÒº
l_n=6.55;
rmf=1;
rw=0.1:0.01:2;
kd1=-2.3*(l_p1-l_n)/(l_p1+l_n)*r*t/f       %%NaClÈÜÒº
kd2=-2.3*(l_p2-2*l_n)/(2*l_p2+2*l_n)*r*t/f  %%cacl2ÈÜÒº
kd=-2.3*r*t/f 
ed1=1000*kd1*log10(rmf./rw);
ed2=1000*kd2*log10(rmf./rw);
plot(rw,ed1);
hold on 
plot(rw,ed2);
% axis([0.1,1,0,0.015])
xlabel('Rw');
ylabel('Ed');
legend('nacl','cacl2');