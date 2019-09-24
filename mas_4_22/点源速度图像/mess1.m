clear all
z=linspace(0,6,120);
r=linspace(-1,1,120);
[r,z]=meshgrid(r,z);
u1=((35.27/76.95)*pi*exp(-76.95*(r./z).^2)).^0.5;% （射流速度场）
u2=((99.49/144.18)*z.*pi*exp(-144.18*(r./z).^2)).^(1/3); % （羽流速度场）
u=u1+u2;
subplot(1,2,1);surf(u1);
subplot(1,2,2);surf(u2);