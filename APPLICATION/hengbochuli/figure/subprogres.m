%%
clc;
figure;
% scatter(b(:,1)./3.28,b(:,2)./3.28,'r^');
scatter(vsn./3.28,vscn./3.28,'r^');
hold on
% scatter(a(:,1)./3.28,a(:,2)./3.28,'go');
scatter(vs./3.28,vsc./3.28,'go');
hidden on
xlabel('\fontsize{7.5}Êµ¼Êºá²¨ km/s');
ylabel('\fontsize{7.5}¼ÆËãºá²¨ km/s');
legend('\fontsize{7.5}·Ç´¢²ã','\fontsize{7.5}´¢²ã');

%%
figure;
clc
scatter3(vp./3.28,1./m,vs./3.28,'go');
hold on;
scatter3(vpn./3.28,1./mn,vsn./3.28,'r^');
legend('\fontsize{7.5}´¢²ã','\fontsize{7.5}·Ç´¢²ã');
xlabel('\fontsize{7.5}×Ý²¨ËÙ¶È km/s');
ylabel('\fontsize{7.5}ÃÜ¶È g/cm3');
zlabel('\fontsize{7.5}ºá²¨ËÙ¶È km/s');

grid on
%%
