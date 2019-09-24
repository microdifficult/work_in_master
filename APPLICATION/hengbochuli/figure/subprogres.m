%%
clc;
figure;
% scatter(b(:,1)./3.28,b(:,2)./3.28,'r^');
scatter(vsn./3.28,vscn./3.28,'r^');
hold on
% scatter(a(:,1)./3.28,a(:,2)./3.28,'go');
scatter(vs./3.28,vsc./3.28,'go');
hidden on
xlabel('\fontsize{7.5}ʵ�ʺᲨ km/s');
ylabel('\fontsize{7.5}����Შ km/s');
legend('\fontsize{7.5}�Ǵ���','\fontsize{7.5}����');

%%
figure;
clc
scatter3(vp./3.28,1./m,vs./3.28,'go');
hold on;
scatter3(vpn./3.28,1./mn,vsn./3.28,'r^');
legend('\fontsize{7.5}����','\fontsize{7.5}�Ǵ���');
xlabel('\fontsize{7.5}�ݲ��ٶ� km/s');
ylabel('\fontsize{7.5}�ܶ� g/cm3');
zlabel('\fontsize{7.5}�Შ�ٶ� km/s');

grid on
%%
