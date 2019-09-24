clc
clear all;
load uran_correction.mat;
cal=data(:,3);
uran=data(:,2);
DENM=input('your mud density is ...\n');
A=0.5414+0.0496528*DENM-0.05091912*DENM^2;
B=0.039856-0.0149743*DENM+9.67845*1e-3*DENM^2;
C=-4.05*1e-4+2.41*1e-4*DENM-1.2394*1e-4*DENM^4;
uran_c=(A+B.*cal+C.*cal.^2).*uran;
