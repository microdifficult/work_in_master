clc
clear all
load k_para.mat
sw=sw/100;
swi=swi/100;

%%
%彼尔逊方程
krw=((sw-swi)./(1-swi)).^0.5.*(sw.^3);
kr0=(1-(sw-swi)./(1-swi)).^2;

figure;
subplot(321);

scatter(dept,krw);
title('krw');
set(gca,'ylim',[0,1]);
view(90,90);

subplot(322);

scatter(dept,kr0);
set(gca,'ylim',[0,1]);
title('kr0');
view(90,90);




%%
%琼斯方程
krw1=((sw-swi)./(1-swi)).^3;
kr01=((0.9-sw)./(0.9-swi)).^2;
subplot(323);
scatter(dept,krw1);         
title('krw1');
set(gca,'ylim',[0,1]);
view(90,90);

subplot(324);

scatter(dept,kr01);
set(gca,'ylim',[0,1]);
set(gca,'xlim',[1360,1400]);
title('kr01');
view(90,90);


%%
%普遍形式
sw(sw==1)=0.969;                            %因为水层sw=1，(1-((sw-swi)./(1-swi-sor))项出现负数，经计算得到是sw>1-sor,sw》0.97，则为负，所以取sw=0.969
krw2=((sw-swi)./(1-swi)).^3.5;
sor=0.03;
kr02=(1-(sw-swi)./(1-swi-sor)).^2.*(1-((sw-swi)./(1-swi-sor)).^1.5);
% a=(1-sw)./(1-sor-swi);
% b=(1-sw)./(1-swi);
% kr010=(1-a).^2.*(1-b.^2);
subplot(325);
scatter(dept,krw2);                                           
title('krw2');
set(gca,'ylim',[0,1]);
set(gca,'xlim',[1360,1400]);
view(90,90);

subplot(326);

scatter(dept,kr01);
set(gca,'ylim',[0,1]);
set(gca,'xlim',[1360,1400]);
title('kr02');
view(90,90);

