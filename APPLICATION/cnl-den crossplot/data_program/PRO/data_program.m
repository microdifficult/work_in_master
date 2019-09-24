clear all;
clc;
disp('load filename');
filename=input('','s');
disp('save filename');
filename2=input('','s');
[fid,message]=fopen(filename,'r');
if fid==-1
    disp(message);
end
[dept,den,cnl]=textread(filename,'%f %f %f','headerlines',1);
fclose(fid);
pore_cnl=cnl/100;
pore_den=(den-2.65)./(1-2.65);
pore_sd=0.4;
pore_sd2=1.33*pore_sd;
disp('choose the condition you are faced');
disp('NO1:CL point.Q point,W point is what we got');
disp('NO2:Sh0 point.Q point,W point is what we got');
disp('NO3:DC point.Q point,W point is what we got');
IPEG=input('');
%%              condition 1:
%%              CL point.Q point,W point 
if IPEG==1
    disp('your CL point is...');
    cl=input('');
    disp('choose SI RATE CALCULATION TYPE\n,1\2?');
    IPED=input('');
    clx=cl(1);
    cly=cl(2);
    q=[0,0];
    w=[1,1];
    pore_eff=abs(pore_den*clx-pore_cnl*cly)./abs(clx-cly);
    vcl=abs(pore_den-pore_cnl)./abs(clx-cly);   
    for ii=1:size(pore_eff,1)
if pore_eff(ii)>1
   pore_eff(ii)=1;
else if pore_eff(ii)<0;
        pore_eff(ii)=0;
    end
end

    end
    for ii=1:size(vcl,1)
if vcl(ii)>1
   vcl(ii)=1;
else if vcl(ii)<0;
        vcl(ii)=0;
    end
end

    end
    
    %% SI RATE 1
if IPED==1   
syms pore_eff3 pore_sd3 vcl3 si3 
si3=solve('pore_eff3=pore_sd3*(1-vcl3^2/(1-si3)^2*(2-vcl3/(1-si3)))','si3');
j=1;
for i=1:size(si3)
   if isreal(si3(i))
       si3(j)=si3(i);
       j=j+1;
   end
    
end
si3(j+1:end)=[];
si=subs(si3,{pore_eff3,pore_sd3,vcl3},{pore_eff,pore_sd*ones(size(pore_eff,1),1),vcl});
si=real(si);
end
    
    %%  SI RATE 2
    if IPED==2
syms a pore_cnl4 pore_den4 pore_sd4 pore_sd24 clx4 cly4 si4 z
si4=1-z;
si4=subs(si4,z,(a-1)*pore_sd24/(a*clx4-cly4));
si4=subs(si4,a,(pore_sd24-pore_den4)/(pore_sd24-pore_cnl4));
si=subs(si4,{pore_sd4,pore_sd24,clx4,cly4,pore_cnl4,pore_den4},{pore_sd*ones(size(vcl,1),1),pore_sd2*ones(size(vcl,1),1),clx*ones(size(vcl,1),1),cly*ones(size(vcl,1),1),pore_cnl,pore_den});
    
    end
         for ii=1:size(si,1)
if si(ii)>1
   si(ii)=1;
else if si(ii)<0;
        si(ii)=0;
    end
end

     end
    
    data=[dept,pore_cnl,pore_den,pore_eff,vcl,si];
  dlmwrite(filename2,data,'precision','%.4f','delimiter','\t');
end
  reply = input('Do you want more? Y/N [Y]: ', 's');
if isempty(reply)
    reply = 'Y';
end
 %% condition 2
    %% Sh0 point,Q point,W point 
    if IPEG==2
    disp('your Sh0 point is...');
    sh0=input('');
    sh0x=sh0(1);
    sh0y=sh0(2);
    q=[0,0];
    w=[1,1];
    pore_eff=abs(pore_cnl*sh0y-pore_den*sh0x)./abs(sh0x-sh0y);
    vsh=abs(pore_den-pore_cnl)./abs(sh0x-sh0y);
     for ii=1:size(vsh,1)
if vsh(ii)>1
   vsh(ii)=1;
else if vsh(ii)<0;
        vsh(ii)=0;
    end
end

     end
  

       %% shale distribution assured    
syms pore2_eff sd2 vsh2 vlam vdis vstr
e1=sym('pore2_eff=sd2*(1-vlam)-vdis');
e2=sym('vsh2=vdis+vlam+vstr');
e3=sym('vlam=(vlam+vstr)^2*(2-vlam-vstr)');
[vdis,vlam,vstr]=solve(e1,e2,e3,'vdis','vlam','vstr');
j=1;
% vdis=double(vdis);
% vlam=double(vlam);
% vstr=double(vstr);
for i=1:size(vdis,1)
   if isreal(vdis(i))
       vdis(j)=vdis(i);
       j=j+1;
   end
    
end
vdis(j+1:end)=[];
j=1;
for i=1:size(vlam)
   if isreal(vlam(i))
       vlam(j)=vlam(i);
       j=j+1;
   end
    
end
vlam(j+1:end)=[];
j=1;
for i=1:size(vstr)
   if isreal(vstr(i))
       vstr(j)=vstr(i);
       j=j+1;
   end
    
end
vstr(j+1:end)=[];                                                                           %%赋予空值而不是nan
vdis=subs(vdis,{pore2_eff,sd2,vsh2},{pore_eff,pore_sd*ones(size(pore_eff,1),1),vsh});
vlam=subs(vlam,{pore2_eff,sd2,vsh2},{pore_eff,pore_sd*ones(size(pore_eff,1),1),vsh});            %%subs代入的新用法:1多量带入：2新值为列向量
vstr=subs(vstr,{pore2_eff,sd2,vsh2},{pore_eff,pore_sd*ones(size(pore_eff,1),1),vsh});
for ii=1:size(vdis,1)
if vdis(ii)>1
   vdis(ii)=1;
else if vdis(ii)<0;
        vdis(ii)=0;
    end
end

end
 for ii=1:size(vlam,1)
if vlam(ii)>1
   vlam(ii)=1;
else if vlam(ii)<0;
        vlam(ii)=0;
    end
end

 end    
for ii=1:size(vstr,1)
if vstr(ii)>1
   vstr(ii)=1;
else if vstr(ii)<0;
        vstr(ii)=0;
    end
end

end


data=[dept,pore_cnl,pore_den,pore_eff,vsh,vdis,vlam,vstr];
dlmwrite(filename2,data,'precision','%.4f','delimiter','\t');
  reply = input('Do you want more? Y/N [Y]: ', 's');
if isempty(reply)
    reply = 'Y';
end
    end


    %% condition 3
    %% DC point,Q point,W point 
    if IPEG==3
    disp('your DC point is...');
    dc=input('');
    dcx=dc(1);
    dcy=dc(2);
    q=[0,0];
    w=[1,1];
    pore_tol=abs(pore_cnl*dcy-pore_den*dcx)./abs(dcx-dcy);
    for ii=1:size(vdis,1)
if pore_tol(ii)>1
   pore_tol(ii)=1;
else if pore_tol(ii)<0;
        pore_tol(ii)=0;
    end
end

    end

    vdc=abs(pore_den-pore_cnl)./abs(dcx-dcy);
    for ii=1:size(vdc,1)
if vdc(ii)>1
   vdc(ii)=1;
else if vdc(ii)<0;
        vdc(ii)=0;
    end
end

end
    data=[dept,pore_cnl,pore_den,pore_tol,vdc];
    dlmwrite(filename2,data,'precision','%.4f','delimiter','\t');
      reply = input('Do you want more? Y/N [Y]: ', 's');
if isempty(reply)
    reply = 'Y';
end
    end
     

    