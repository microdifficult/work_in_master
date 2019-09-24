
%%
clear all;
clc


%%
% filename_input=input('please type your input filename\n','s');
filename_input='data_o.txt';
% filename_output=input('please type your output filename\n','s');
filename_output='data_o.xls';
[fid,message]=fopen(filename_input,'r');
if fid==-1
     disp(message);
end
data=dlmread(filename_input,'\t');
sv=data(:,1);
jd_t=data(:,2);
jd_b=data(:,3);
gr=data(:,4);
sp=data(:,5);
lld=data(:,6);
rxo=data(:,7);
ra_ew=data(:,8);
rilm=data(:,9);
ac=data(:,10);
den=data(:,11);
cnl=data(:,12);
grmax=data(:,13);
grmin=data(:,14);
delta_a=data(:,15);
dgr=data(:,16);
spli=data(:,end);
sh0=[0.35,0.2];
%%
%中子密度孔隙度
pore_den=(den-2.65)./(1-2.65);
for ii=1:size(pore_den,1)
%     if abs(pore_den(ii)-1.605)<0.01
%         pore_den(ii)=0.01;
      if abs(pore_den(ii))>1 
            pore_den(ii)=1;
        else if abs(pore_den(ii))<0
                pore_den(ii)=nan;
            end
      end
end
pore_den=pore_den.*100;
%%
pore_cnl=(cnl+0.05)./1.05;

pore_cross=(pore_den+pore_cnl)./4+((pore_den.^2+pore_cnl.^2)./8).^0.5;

 %%
 %声波孔隙度
 cp=1.639-0.000211*(jd_t+jd_b)./2; 
 pore_ac0=(ac-180)./(440*cp);
 pore_ac=0.8919*pore_ac0.*100+1.0315;

 %%
 pore=(pore_ac+pore_cross)./2;
 %%
 %求解含油饱和度
pore_ac(pore_ac<0)=nan;
pore_cross(abs(pore_cross-60.3672)<0.001)=nan;
sw=((0.93*0.85*0.76)./(lld.*(((pore_ac+pore_cross)./100)./2).^1.64)).^(1.0/1.226);
so=1-sw;
%%
%求解粒度中值及束缚水饱和度可动水饱和度
md=10.^(-0.4352-1.3233*(dgr-0.8));
swi=10.^(0.18-(1.51*log10(md)+3.6).*log10(pore/100/0.18));
swm=sw-swi;


%求解渗透率



%%
data(:,end+1)=pore_cross;
data(:,end+1)=pore_ac;
data(:,end+1)=pore;
data(:,end+1)=so;
data(:,end+1)=md;
data(:,end+1)=swi;
data(:,end+1)=swm;


%%
%中子密度交会图绘制
    sh0x=sh0(1);
    sh0y=sh0(2);
    q=[0,0];
    w=[1,1];
%     h2=figure;
    plot([q(1),sh0x,w(1)],[q(2),sh0y,w(2)],'MarkerFacecolor','r','MarkerSize',10,'LineWidth',1.5);
    hold on;
    plot([q(1),w(1)],[q(2),w(2)],'LineWidth',1.5);
    text(sh0x,sh0y,'\bf\fontsize{15}Sh0 point');         
    %想把点坐标附到上面，暂时没想出办法
    text(0,0,'Q point');
    text(1,1,'W point');
    xlabel('pore_cnl');
    ylabel('pore_den');
    hold on;
    % 插值建立
    x=[0,sh0x];
    y=[0,sh0y];
    xi=0:0.2*sh0x:sh0x;
    yi=interp1(x,y,xi);
    x2=[sh0x,1];
    y2=[sh0y,1];
    x2i=sh0x:(1-sh0x)/5:1;
    y2i=interp1(x2,y2,x2i);
    x3=[0,1];
    y3=[0,1];
    x3i=0:0.2:1;
    y3i=0:0.2:1;
    %画有效孔隙度和粘土含量辅助线
    for ii=1:6
        plot([xi(ii),x2i(7-ii)],[yi(ii),y2i(7-ii)],'--r');
        hold on;
        plot([x3i(ii),x2i(ii)],[y3i(ii),y2i(ii)],'--b');
        hold on;
    end
  hold on;
    scatter(pore_cnl/100,pore_den/100,'ro');
    legend('data point');
    axis([0 1 -0.2 1]);
    hold on
% [success,message]=xlswrite(filename_output,data);
    
%
filename_input='data_ow.txt';
filename_output='data_ow.xls';
% filename_input=input('please type your input filename\n','s');
% filename_output=input('please type your output filename\n','s');

[fid,message]=fopen(filename_input,'r');
if fid==-1
     disp(message);
end
data=dlmread(filename_input,'\t');
sv=data(:,1);
jd_t=data(:,2);
jd_b=data(:,3);
gr=data(:,4);
sp=data(:,5);
lld=data(:,6);
rxo=data(:,7);
ra_ew=data(:,8);
rilm=data(:,9);
ac=data(:,10);
den=data(:,11);
cnl=data(:,12);
grmax=data(:,13);
grmin=data(:,14);
delta_a=data(:,15);
dgr=data(:,16);
spli=data(:,end);
sh0=[0.35,0.1636];
%
pore_den=(den-2.65)./(1-2.65);
for ii=1:size(pore_den,1)
    if abs(pore_den(ii)-1.605)<0.01
        pore_den(ii)=0.01;
      if abs(pore_den(ii))>1 
            pore_den(ii)=1;
        else if abs(pore_den(ii))<0
                pore_den(ii)=0;
            end
      end
    end
end
pore_den=pore_den.*100;
%
pore_cnl=(cnl+0.05)./1.05;
% 中子密度孔隙度
pore_cross=(pore_den+pore_cnl)./4+((pore_den.^2+pore_cnl.^2)./8).^0.5;


%  声波孔隙度
 cp=1.639-0.000211*(jd_t+jd_b)./2; 
 pore_ac0=(ac-180)./(440*cp);
 pore_ac=0.8919*pore_ac0.*100+1.0315;

 %
 pore=(pore_ac+pore_cross)./2;
 %
%  求解含油饱和度
pore_ac(pore_ac<0)=nan;
pore_cross(abs(pore_cross-60.3672)<0.001)=nan;
sw=((0.93*0.85*0.76)./(lld.*(((pore_ac+pore_cross)./100)./2).^1.64)).^(1.0/1.226);
so=1-sw;
%
data(:,end+1)=pore_cross;
data(:,end+1)=pore_ac;
data(:,end+1)=pore;
data(:,end+1)=so;

    scatter(pore_cnl/100,pore_den/100,'co');

    hold on
    
    
% [success,message]=xlswrite(filename_output,data);

%
filename_input='data_w.txt';
filename_output='data_w.xls';
% filename_input=input('please type your input filename\n','s');
% filename_output=input('please type your output filename\n','s');

[fid,message]=fopen(filename_input,'r');
if fid==-1
     disp(message);
end
data=dlmread(filename_input,'\t');
sv=data(:,1);
jd_t=data(:,2);
jd_b=data(:,3);
gr=data(:,4);
sp=data(:,5);
lld=data(:,6);
rxo=data(:,7);
ra_ew=data(:,8);
rilm=data(:,9);
ac=data(:,10);
den=data(:,11);
cnl=data(:,12);
grmax=data(:,13);
grmin=data(:,14);
delta_a=data(:,15);
dgr=data(:,16);
spli=data(:,end);
sh0=[0.35,0.1636];
%
pore_den=(den-2.65)./(1-2.65);
for ii=1:size(pore_den,1)
    if abs(pore_den(ii)-1.605)<0.01
        pore_den(ii)=0.01;
      if abs(pore_den(ii))>1 
            pore_den(ii)=1;
        else if abs(pore_den(ii))<0
                pore_den(ii)=nan;
            end
      end
    end
end

pore_den=pore_den.*100;
%
pore_cnl=(cnl+0.05)./1.05;
% 中子密度孔隙度
pore_cross=(pore_den+pore_cnl)./4+((pore_den.^2+pore_cnl.^2)./8).^0.5;

 %
%  声波孔隙度
 cp=1.639-0.000211*(jd_t+jd_b)./2; 
 pore_ac0=(ac-180)./(440*cp);
 pore_ac=0.8919*pore_ac0.*100+1.0315;

 %
 pore=(pore_ac+pore_cross)./2;
 %
%  求解含油饱和度
pore_ac(pore_ac<0)=nan;
pore_cross(abs(pore_cross-60.3672)<0.001)=nan;
sw=((0.93*0.85*0.76)./(lld.*(((pore_ac+pore_cross)./100)./2).^1.64)).^(1.0/1.226);
so=1-sw;
%
data(:,end+1)=pore_cross;
data(:,end+1)=pore_ac;
data(:,end+1)=pore;
data(:,end+1)=so;


scatter(pore_cnl/100,pore_den/100,'bo');





