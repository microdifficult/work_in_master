
%%
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
    h1=figure;
    plot([q(1),clx,w(1)],[q(2),cly,w(2)],'MarkerFacecolor','r','MarkerSize',10,'LineWidth',1.5);
    hold on;
    plot([q(1),w(1)],[q(2),w(2)],'LineWidth',1.5);
    text(clx,cly,'CL point');         %%想把点坐标附到上面，暂时没想出办法
    text(0,0,'Q point');
    text(1,1,'W point');
    xlabel('pore cnl');
    ylabel('pore den');
    hold on;
                                      % 插值建立
    x=[0,clx];
    y=[0,cly];
    xi=0:0.2*clx:clx;
    yi=interp1(x,y,xi);
    x2=[clx,1];
    y2=[cly,1];
    x2i=clx:(1-clx)/5:1;
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
    scatter(pore_cnl,pore_den);
    legend('data point');
    axis([0 0.5 0 0.5]);
    saveas(gcf,'cnl_den_crossplot.bmp');
    set(gcf,'visible','off');
    pore_eff=abs(pore_den*clx-pore_cnl*cly)./sqrt(clx-cly);
    vcl=abs(pore_den-pore_cnl)./abs(clx-cly);    
    
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
    
    
    data=[dept,pore_cnl,pore_den,pore_eff,vcl,si];
  dlmwrite(filename2,data,'precision','%.4f','delimiter','\t');
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
    h2=figure;
    plot([q(1),sh0x,w(1)],[q(2),sh0y,w(2)],'MarkerFacecolor','r','MarkerSize',10,'LineWidth',1.5);
    hold on;
    plot([q(1),w(1)],[q(2),w(2)],'LineWidth',1.5);
    text(sh0x,sh0y,'Sh0 point');         %%想把点坐标附到上面，暂时没想出办法
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
    scatter(pore_cnl,pore_den);
    legend('data point');
    axis([0 0.5 0 0.5]);
    saveas(gcf,'cnl_den_crossplot.jpg');
    pore_eff=abs(pore_den*sh0x-pore_den*sh0y)./sqrt(sh0x-sh0y);
    vsh=abs(pore_den-pore_cnl)./abs(sh0x-sh0y);

       %% shale distribution assured    
syms pore2_eff sd2 vsh2 vlam vdis  vstr
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




data=[dept,pore_cnl,pore_den,pore_eff,vsh,vdis,vlam,vstr];
dlmwrite(filename2,data,'precision','%.4f','delimiter','\t');

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
    h3=figure;
    plot([q(1),dcx,w(1)],[q(2),dcy,w(2)],'MarkerFacecolor','r','MarkerSize',10,'LineWidth',1.5);
    hold on;
    plot([q(1),w(1)],[q(2),w(2)],'LineWidth',1.5);
    text(dcx,dcy,'DC point');         %%想把点坐标附到上面，暂时没想出办法
    text(0,0,'Q point');
    text(1,1,'W point');
    xlabel('pore_cnl');
    ylabel('pore_den');
    hold on;
                                      % 插值建立
    x=[0,dcx];
    y=[0,dcy];
    xi=0:0.2*dcx:dcx;
    yi=interp1(x,y,xi);
    x2=[dcx,1];
    y2=[dcy,1];
    x2i=dcx:(1-dcx)/5:1;
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
    scatter(pore_cnl,pore_den);
    legend('data point');
    axis([0 0.5 0 0.5]);
    saveas(gcf,'cnl_den_crossplot.jpg');
    pore_tol=abs(pore_den*dcx-pore_den*dcy)./sqrt(dcx-dcy);
    vdc=abs(pore_den-pore_cnl)./abs(dcx-dcy);
   
 data=[dept,pore_cnl,pore_den,pore_tol,vdc];
dlmwrite(filename2,data,'precision','%.4f','delimiter','\t');
    
     end
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
