subplot(131) 
hist(rt_oil,20,'r');
set(gca,'xtick',[5:2.5:30]);
set(gca,'xlim',[5,30]);


subplot(132) 
hist(rt_ow,20);
set(gca,'xtick',[4:1:10]);

subplot(133) 
hist(rt_w,20);
set(gca,'xtick',[3:1:12]);