clear all
clc
pore=0.01:0.0001:1;

for md=0.1:0.1:1;
    swi=(0.3-(1.5.*log10(md)+3.6).*log10(pore./0.12));
    plot(10.^(swi),pore);
    axis([0,1,0.2,0.4])
    hold on;
end