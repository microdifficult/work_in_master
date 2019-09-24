clc
clear all;
load cnl_corr.mat;
i=0:0.01:1;
hmc=8.5*2.504-CAL(1);
cnl_corr2=(0.825^0.25).*i.*(hmc).^0.735.*(i-0.225).*0.25+i;
plot(i,cnl_corr2);