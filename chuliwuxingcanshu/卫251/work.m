pore=data(:,1);
k=data(:,2);
density=data(:,3);
mts=data(:,4);
yls=data(:,5);
gls=data(:,6);
lns=data(:,7);
ca=data(:,8);
c=data(:,9);
m=data(:,10);
vsh=data(:,11);
ave=nan(size(data,1),11);
ave(1,:)=[nanmean(pore),nanmean(k),nanmean(density),nanmean(mts),nanmean(yls),nanmean(gls),nanmean(lns),nanmean(ca),nanmean(c),nanmean(m),nanmean(vsh)];
pore=[pore,ave(:,1)];
k=[k,ave(:,2)];
density=[density,ave(:,3)];
mts=[mts,ave(:,4)];
yls=[yls,ave(:,5)];
gls=[gls,ave(:,6)];
lns=[lns,ave(:,7)];
ca=[ca,ave(:,8)];
c=[c,ave(:,9)];
m=[m,ave(:,10)];
vsh=[vsh,ave(:,11)];
figure;
hist(pore(:,1),20);
xlabel('pore');
saveas(gcf,'��϶��','bmp');

figure;
hist(k(:,1),20);
xlabel('k');
saveas(gcf,'��͸��','bmp');



figure;
hist(density(:,1),20);
xlabel('density');
saveas(gcf,'�ܶȷֲ�','bmp');

figure;
hist(mts(:,1),20);
xlabel('mts');
saveas(gcf,'����ʯ����','bmp');

figure;
hist(yls(:,1),20);
xlabel('yls');
saveas(gcf,'����ʯ����','bmp');


figure;
hist(gls(:,1),20);
xlabel('gls');
saveas(gcf,'����ʯ����','bmp');

figure;
hist(lns(:,1),20);
xlabel('lns');
saveas(gcf,'����ʯ����','bmp');


figure;
hist(ca(:,1),20);
xlabel('ca');
saveas(gcf,'���ʺ���','bmp');

figure;
hist(c(:,1),20);
xlabel('c');
saveas(gcf,'��ѡϵ��','bmp');

figure;
hist(m(:,1),20);
xlabel('m');
saveas(gcf,'������ֵ','bmp');

figure;
hist(vsh(:,1),20);
xlabel('vsh');
saveas(gcf,'���ʺ���','bmp');
close all;


dlmwrite('��϶��.xls',pore,'delimiter','\t','precision',6) ;
dlmwrite('��͸��.xls',k,'delimiter','\t','precision',6) ;
dlmwrite('�ܶ�.xls',density,'delimiter','\t','precision',6) ;
dlmwrite('����ʯ.xls',mts,'delimiter','\t','precision',6) ;
dlmwrite('����ʯ.xls',yls,'delimiter','\t','precision',6) ;
dlmwrite('����ʯ.xls',gls,'delimiter','\t','precision',6) ;
dlmwrite('����ʯ.xls',lns,'delimiter','\t','precision',6) ;
dlmwrite('���ʺ���.xls',ca,'delimiter','\t','precision',6) ;
dlmwrite('��ѡϵ��.xls',c,'delimiter','\t','precision',6) ;
dlmwrite('������ֵ.xls',m,'delimiter','\t','precision',6) ;
dlmwrite('���ʺ���.xls',vsh,'delimiter','\t','precision',6) ;

