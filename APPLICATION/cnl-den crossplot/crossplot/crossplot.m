
%%
clear all;
clc;
disp('load filename');
filename=input('','s');
% disp('save filename');
% filename2=input('','s');
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
%     disp('choose SI RATE CALCULATION TYPE\n,1\2?');
%     IPED=input('');
    clx=cl(1);
    cly=cl(2);
    q=[0,0];
    w=[1,1];
    h1=figure;
    plot([q(1),clx,w(1)],[q(2),cly,w(2)],'MarkerFacecolor','r','MarkerSize',10,'LineWidth',1.5);
    hold on;
    plot([q(1),w(1)],[q(2),w(2)],'LineWidth',1.5);
    text(clx,cly,'\bf\fontsize{15}CL point');         %%想把点坐标附到上面，暂时没想出办法
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
    hidden off;
    legend('data point');
    axis([0 0.5 0 0.5]);
    grid on;
    saveas(gcf,'cnl_den_crossplot.bmp');
   
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
    text(sh0x,sh0y,'\bf\fontsize{15}Sh0 point');         %%想把点坐标附到上面，暂时没想出办法
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
    axis([0 1 -0.2 1]);
    saveas(gcf,'cnl_den_crossplot.bmp');
    

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
   
     end
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
