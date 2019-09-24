l/2*r^3/(((r^2+(z-l/2)^2)^(1.5))*((r^2+(z+l/2)^2)^(1.5)))
piecewise([r in R_ or Re(r) = 0, Inf], [not r in R_ and Re(r) <> 0, Inf + Im(r)*Re(r)*i*Inf])
q=int(g,z,-4,4);
figure;
fplot(q*0.5,r/0.5)