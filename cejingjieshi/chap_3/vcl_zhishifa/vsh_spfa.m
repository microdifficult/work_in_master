clc
clear all;
load matlab.mat

%%
spmax=max(sp);
spli=(spmax+spmax-3)/2;
spmin=sort(sp,'ascend');
spmin=mean(spmin(1:20));
vsh=1-((sp-spli)./(spmin-spli));
% plot(vsh,dep);
% vcl=((sp-spli-spmin)./(spmin-spli-spmin));
%%


%%
rcl=2.37;
alpha=((sp-spli)./(spmin-spli));
a=(lld./rxo);
b=(lld./rcl);
p=exp(log(a)./(1-alpha));
f=@(vcl)1-alpha-log(a)./log((a-vcl*b)./(1-vcl*b));
% vcll=zeros(size(alpha,1),1);
% for i=1:size(alpha,1)
% f=@(vcl)1-alpha(i)-log(a(i))./log((a(i)-vcl*b(i))./(1-vcl*b(i)));
% vcll(i)=f2fen(f,0,1);
% end


