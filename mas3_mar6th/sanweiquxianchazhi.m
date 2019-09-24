clear,clc
x = [0 .31667 .60074 .82298 .96052 .99919 .93502 .7746 .53447 .23932 0.08047 -.39197 -.66312 -.86603 -.97979 -.99271 -.90345 -.7212 -.46472 -.16041 .16041 .46472 .7212 .90345 .99271 .97979 .86603 .66312 .39197 .080467 -.23932 -.53447 -.7746 -.93502 -.99919 -.96052 -.82298 -.60074 -.31667 0];
y = [1 .88546 .56806 .12054 -.3546 -.74851 -.97094 -.97094 -.74851 -.3546 .12054 .56806 .88546 1 .88546 .56806 .12054 -.3546 -.74851 -.97094 -.97094 -.74851 -.3546 .12054 .56806 .88546 1 .88546 .56806 .12054 -.3546 -.74851 -.97094 -.97094 -.74851 -.3546 .12054 .56806 .88546 1];
z = [1 .79944 .27822 -.3546 -.84519 -.99676 -.74851 -.20003 .42869 .88546 .98705 .69272 .12054 -.5 -.91998 -.97094 -.63245 -.04027 .56806 .94854 .94854 .56806 -.04027 -.63245 -.97094 -.91998 -.5 .12054 .69272 .98705 .88546 .42869 -.20003 -.74851 -.99676 -.84519 -.3546 .27822 .79944 1];
l = length(x);
sp = spline(1:l,[x;y;z],1:.1:l);
plot3(x,y,z,'ro',sp(1,:),sp(2,:),sp(3,:),'linewidth',1.5)
grid on
