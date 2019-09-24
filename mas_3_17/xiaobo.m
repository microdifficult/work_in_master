clc
clear all;
[fid,message]=fopen('1.txt','r');
if fid==-1
    disp(message);
end
[dept,gr]=textread('1.txt','%f %f','headerlines',1);
fclose(fid);
x=gr';

%%
[c,l]=wavedec(x,3,'db10');
A=wrcoef('A',c,l,'db10',1);
D1=wrcoef('d',c,l,'db10',1);
D2=wrcoef('d',c,l,'db10',2);  
D3=wrcoef('d',c,l,'db10',3);
figure;
subplot(151);plot(x);view(90,90);
subplot(152);plot(A);view(90,90);
subplot(153);plot(D1);view(90,90);
subplot(154);plot(D2);view(90,90);
subplot(155);plot(D3);view(90,90);
%%

