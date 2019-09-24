clc
clear all;
a=54321;
b=num2str(a);
for i=1:size(b,2)
c(i)=str2double(b(i));
end