clear all;
f1=dsolve('Dy=1.2*y+200*x-8','y(0)=350','x')
ezplot(f1)