R=200;
dy=@(xx,yy)exp(R)/sqrt(pi)*(sqrt(R)*sec(xx)*exp(-R*sec(xx))+sqrt(pi)/2*erfc(sqrt(R)*sec(xx)))*cos(xx);	
[xx,yy]=ode45(dy,(-15*pi/180:30*pi/180000:15*pi/180),0);	
plot(xx,diff(yy));