A=[
108.34 34.52 308
109.34 34.42 276
110.24 35.52 225
110.14 34.52 194
111.34 34.62 189
110.04 33.52 173
109.24 34.72 17
];
x=A(:,1);
y=A(:,2);
z=A(:,3);
minx = min(x);
maxx = max(x);
miny = min(y);
maxy = max(y);
linspace(minx,maxx);
[X,Y,Z]=griddata(x,y,z,linspace(minx,maxx)',linspace(miny,maxy),'linear');  %²åÖµ
figure
plot3(x,y,z,'*')
[C,h] = contourf(X,Y,Z);
% clabel(C,h);     %  Contour plot elevation labels
% colorbar   %   ÑÕÉ«Ìõ
