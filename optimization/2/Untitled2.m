clc
clear all
load cnl_correction.mat
cal=dataa(:,3);
cnl=100*dataa(:,2);
%%
% cnl=cnl+4;        %����У��

%%
% data=[cal,cnl];
% cnld=zeros(size(data,1),1);
% for i=1:size(data,1)
%     if data(i,1)<20
%         cnld(i)=data(i,2)-1/112.*(data(i,1)-20).*(data(i,2)+38);
%     end
%     if data(i,1)>20
%         cnld(i)=37/38*(data(i,2)-2)-0.0079.*(data(i,2)+27.3365).*(data(i,1)-25);
%     end                                                                                    %����У��
% end
% 
% cnld=[dataa(:,1),cnld/100];

%%

data=[cal,cnl];
cnlm=zeros(size(data,1),1);
bits=8.5;

hmc=-0.5*(data(:,1)-bits);
hmc(hmc<=0)=nan;
for j=1:size(data,1)
    if data(j,2)<=20
        cnlm(j)=data(j,2)+7.859*1e-3*data(j,2).*(data(j,2)-21.5).*hmc(j).^0.7377;              %���У��Ч��������
    end
    if data(j,2)>20
        cnlm(j)=data(j,2)+0.003*data(j,2).*(data(j,2)-21.5).*hmc(j).^0.864;                      %ע��ѭ�������в�Ҫ����������
    end
end


for k=1:size(cnlm,1)
    if isnan(cnlm(k))
        cnlm(k)=cnl(k);
    end
end



cnlm_show=[dataa(:,1),cnlm/100];
