clear all;
clc
% filename_input=input('please type your input filename\n','s');
filename_input='data.txt';
% filename_output=input('please type your output filename\n','s');
filename_output='data.xls';
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
spli=data(:,17);
result=data(:,end);
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
                pore_den(ii)=0;
            end
      end
end
pore_den=pore_den.*100;
%%

pore_cnl=(cnl+0.05)./1.05;


pore_cross=(pore_den+pore_cnl)./4+((pore_den.^2+pore_cnl.^2)./8).^0.5;
pore_cross(pore_cross>50)=nan;

 %%
 %声波孔隙度
 cp=1.639-0.000211*(jd_t+jd_b)./2; 
 pore_ac0=(ac-180)./(440*cp);
 pore_ac=0.8919*pore_ac0.*100+1.0315;

 %%
 %中字密度交会孔隙度
 pore=(pore_ac+pore_cross)./2;
%%
vsh=0.083*(2.^(3.7*(dgr-0.8))-1);
 %%
 %求解含油饱和度
pore_ac(pore_ac<0)=nan;
pore_cross(abs(pore_cross-60.3672)<0.001)=nan;
sw=((0.93*0.85*0.76)./(lld.*(((pore_ac+pore_cross)./100)./2).^1.64)).^(1.0/1.226);
so=1-sw;
%%
%求解粒度中值及束缚水饱和度可动水饱和度
md=10.^(-0.4352-1.3233*(dgr-0.8));
swi=10.^(0.18-(1.51*log10(md)+3.6).*log10(pore_cross/100/0.18));
swm=sw-swi;


%求解渗透率
kk=10.^((4.4+0.4./log10(pore./100/0.114))+7.1.*log10(pore./100)-1.1*log10(swi)./log10(pore./100/0.114));



%%
data(:,end+1)=pore_cross;
data(:,end+1)=pore_ac;
data(:,end+1)=pore;
data(:,end+1)=kk;
data(:,end+1)=vsh;
data(:,end+1)=md;
data(:,end+1)=so;
data(:,end+1)=swi;
data(:,end+1)=swm;
[success,message]=xlswrite(filename_output,data);