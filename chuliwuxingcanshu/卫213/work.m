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
saveas(gcf,'孔隙度','bmp');

figure;
hist(k(:,1),20);
xlabel('k');
saveas(gcf,'渗透率','bmp');



figure;
hist(density(:,1),20);
xlabel('density');
saveas(gcf,'密度分布','bmp');

figure;
hist(mts(:,1),20);
xlabel('mts');
saveas(gcf,'蒙脱石含量','bmp');

figure;
hist(yls(:,1),20);
xlabel('yls');
saveas(gcf,'伊利石含量','bmp');


figure;
hist(gls(:,1),20);
xlabel('gls');
saveas(gcf,'高岭石含量','bmp');

figure;
hist(lns(:,1),20);
xlabel('lns');
saveas(gcf,'绿泥石含量','bmp');


figure;
hist(ca(:,1),20);
xlabel('ca');
saveas(gcf,'钙质含量','bmp');

figure;
hist(c(:,1),20);
xlabel('c');
saveas(gcf,'分选系数','bmp');

figure;
hist(m(:,1),20);
xlabel('m');
saveas(gcf,'粒度中值','bmp');

figure;
hist(vsh(:,1),20);
xlabel('vsh');
saveas(gcf,'泥质含量','bmp');
close all;


dlmwrite('孔隙度.xls',pore,'delimiter','\t','precision',6) ;
dlmwrite('渗透率.xls',k,'delimiter','\t','precision',6) ;
dlmwrite('密度.xls',density,'delimiter','\t','precision',6) ;
dlmwrite('蒙脱石.xls',mts,'delimiter','\t','precision',6) ;
dlmwrite('伊利石.xls',yls,'delimiter','\t','precision',6) ;
dlmwrite('高岭石.xls',gls,'delimiter','\t','precision',6) ;
dlmwrite('绿泥石.xls',lns,'delimiter','\t','precision',6) ;
dlmwrite('钙质含量.xls',ca,'delimiter','\t','precision',6) ;
dlmwrite('分选系数.xls',c,'delimiter','\t','precision',6) ;
dlmwrite('粒度中值.xls',m,'delimiter','\t','precision',6) ;
dlmwrite('泥质含量.xls',vsh,'delimiter','\t','precision',6) ;

