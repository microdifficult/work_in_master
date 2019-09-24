clc
clear all;
a=[1 -1 4;
   2 3 -1;
   -1 1 0];
b=orth(a)

for i=1:3
s=sum(b(i,:).^2)
end
% s=0;
% for i=1:3
%     s=s+b(i,1)^2
% end
