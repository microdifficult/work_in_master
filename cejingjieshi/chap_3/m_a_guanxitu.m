%%
pore=0.001:0.001:1;
k=1:1000;
m=10.^(0.34-0.12.*pore-0.023.*log10(k));
figure;
plot3(pore,k,m);

%%
clear all;
i=1;
for a=0:0.2:2
m_=2;
pore=0:0.1:1;
m=m_-log10(a)./log10(pore);
subplot(1,11,i);        %子图的多重循环绘制
title('a');
i=i+1;
plot(pore,m);
xlabel('pore');
ylabel('m');
end
