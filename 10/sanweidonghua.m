clear all;
close all;
[x,y,z]=peaks(20);
figure;
h=surf(x,y,z);
colormap(jet);
axis off;
n=200;
for i=1:n;
    rotate(h,[0 0 1],10);
    mv(:,i)=getframe;
end
movie(mv,1,10)