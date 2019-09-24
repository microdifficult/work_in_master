clear all
x=-10:0.1:10;
y=-10:0.1:10;
[X,Y]=meshgrid(x,y);
z=X.^2+Y.^2;
mesh(x,y,z)
colormap('cool');
shading interp;
light('Position',[1 0.4 0.4]);
axis square;
xlabel('x');
ylabel('y');
zlabel('z');
