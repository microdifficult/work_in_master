clear all;
clc
figure;
ezplot3('cos(t)','t*sin(t)','sqrt(t)',[0,2*pi],'animate')
clear all;
figure;
ezplot3('cos(t)','t*sin(t)','sqrt(t/2)',[0,50],'animate')