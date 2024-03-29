clear all;
clc
%%
filename=input('please load your file\n','s');
disp('your output file');
output=input('','s');

[fid,message]=fopen(filename,'r');
if fid==-1
    disp(message);
end
% a=dlmread(filename,'\t');
[dept,gr,sp,cal,lld,msfl,lls,hac,den,cnl,rmn,rmg]=textread(filename,'%f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
%%
bits=21.59;rwf=1;rwb=0.5;m=1.7;n=2;                    %%参数值可以进行修改
disp('please type your parameter,the order is grmax grmin cnlmax cnlmin spmax spmin');
para=input('');
disp('type your SHCT and IPEG');
matr=input('');
shct=matr(1);
IPEG=matr(2);
gmx1=para(1);
gmn1=para(2);
gmx2=para(3);
gmn2=para(4);
gmx3=para(5);
gmn3=para(6);
%%
if exist('sp')
 else
     disp('sp data is lost');
     return;
 end
  if exist('den')
  else
   disp('den data is lost');
   return;
 end
  if exist('cnl')
  else
   disp('cnl data is lost');
     return;
  end
 if exist('cal')
     dcal=cal-bits;
 else
     dcal=0;
 end
 


 %%
 
 %%
 shlg1=gr;
 shlg2=cnl;
 shlg3=sp;
 ashg=(shlg1-gmn1)./(gmx1-gmn1);
 ashc=cnl./100;
 ashs=(shlg3-gmn3)./(gmx3-gmn3);
 for ii=1:size(ashg,1)
if ashg(ii)>1
   ashg(ii)=1;
else if ashg(ii)<0;
        ashg(ii)=0;
    end
end
 end
 for ii=1:size(ashc,1)
if ashc(ii)>1
   ashc(ii)=1;
else if ashc(ii)<0;
        ashc(ii)=0;
    end
end
 end
 for ii=1:size(ashs,1)
if ashs(ii)>1
   ashs(ii)=1;
else if ashs(ii)<0;
        ashs(ii)=0;
    end
end
 end
 ash=[ashg,ashc,ashs];
 ash=sort(ash,2,'ascend');
 for ii=1:size(ash,1)
 swb(ii)=(ash(ii,1)+ash(ii,2))./2;
 end
 swb=swb';
 %%
 
if IPEG==1
por_den=(den-2.65)./(1-2.65);
for ii=1:size(por_den,1)
if por_den(ii)>1
   por_den(ii)=1;
else if por_den(ii)<0;
        por_den(ii)=0;
    end
end
end
 for ii=1:size(por_den,1)
 if swb(ii)>=shct
     por_den=por_den.*(1-swb(ii));
 end
 end
 
%  swt_den=((4*por_den.^m.*lld*rwb^2*rwf + por_den.^(2*m).*lld.^2*rwb^2.*swb.^2 + por_den.^(2*m).*lld.^2*rwf^2.*swb.^2 - 2*por_den.^(2*m).*lld.^2*rwb*rwf.*swb.^2).^(1/2) + por_den.^m.*lld*rwb.*swb - por_den.^m.*lld*rwf.*swb)./(2*por_den.^m.*lld.*rwb);
 r0_den=(rwf.*rwb)./(por_den.^m.*(swb.*rwb+(1-swb).*rwf));
 swt_den=(r0_den./lld).^(1/n);
 
 for ii=1:size(swt_den,1)
if swt_den(ii)>1
   swt_den(ii)=1;
else if swt_den(ii)<0;
        swt_den(ii)=0;
    end
end
 end
jj=1;
for ii=1:size(swt_den,1)
if swt_den(ii)>0.6
   sw_den(jj)=swt_den(ii);
   jj=jj+1;
else
    sw_den(ii)=(swt_den(ii)-swb(ii))./(1-swb(ii));
    jj=jj+1;
end
end
sw_den=sw_den';
k0_den=(1-sw_den).*(1-(sw_den.^0.25).*(swt_den.^0.5));
kw_den=sw_den.^0.5.*swt_den.^3;
swb=swb*100;
k_den=k0_den./kw_den;
porw_den=por_den*100;
sw_den=sw_den*100;
por_den=por_den*100;

%%
por_den(swb>shct)=0;
porw_den(swb>shct)=0;
sw_den(swb>shct)=0;          %泥岩卡值
r0_den(swb>shct)=0;   
k_den(swb>shct)=0;
swb(swb>shct)=0;




data=[dept,dcal,swb,por_den,r0_den,sw_den,k_den,porw_den];
% data=[dept,dcal,swb,por_den,sw_den,k_den,porw_den];
[success,message]=xlswrite(output,data);
end

 %%
 
if IPEG==2
por_hac=(hac-182)./(620-182);
for ii=1:size(por_hac,1)
if por_hac(ii)>1
   por_hac(ii)=1;
else if por_hac(ii)<0;
        por_hac(ii)=0;
    end
end
end
  for ii=1:size(por_hac,1)
 if swb(ii)>=shct
     por_hac=por_hac.*(1-swb(ii));
 end
  end
 r0_hac=(rwf*rwb)./(por_hac.^m.*(swb.*rwb+(1-swb).*rwf));
 swt_hac=(r0_hac./lld).^(1/n);
 for ii=1:size(swt_hac,1)
if swt_hac(ii)>1
   swt_hac(ii)=1;
else if swt_hac(ii)<0;
        swt_hac(ii)=0;
    end
end
 end
 kk=1;
for ii=1:size(swt_hac,1)
if swt_hac(ii)>0.6
   sw_hac(kk)=swt_hac(ii);
   kk=kk+1;
else
    sw_hac(kk)=(swt_hac(ii)-swb(ii))./(1-swb(ii));
    kk=kk+1;
end
end
sw_hac=sw_hac';
k0_hac=(1-sw_hac).*(1-(sw_hac.^0.25).*(swt_hac.^0.5));
kw_hac=sw_hac.^0.5.*swt_hac.^3;
k_hac=k0_hac./kw_hac;
porw_hac=por_hac*100;
swb=swb*100;
sw_hac=sw_hac*100;
por_hac=por_hac*100;

%%
por_hac(swb>shct)=0;
porw_hac(swb>shct)=0;
sw_hac(swb>shct)=0;
r0_hac(swb>shct)=0;
k_hac(swb>shct)=0;   %%泥岩卡值
swb(swb>shct)=0;

%%


data=[dept,dcal,swb,por_hac,r0_hac,sw_hac,k_hac,porw_hac];
[success,message]=xlswrite(output,data);
end


%%
% data=num2cell(data);
% cell(a);
% a(1,:)={};





%  for ii=1:size(ashs,1)
%  if ashs(ii)>=shct
%      porw_den(ii)=por_den.*swt_den;
%      porw_hac(ii)=por_hac.*swt_hac;
%      ashs(ii)=ashs*100;
%      swb(ii)=swb*100;
%      sw_den(ii)=sw_den*100;
%      sw_hac=sw_hac*100;
%      por_den=porw_den*100;
%      por_hac=porw_hac*100;
% 
%  end
%  end

     
 



















fclose(fid);
