function dX = eomR3BP(t,X);
global mu

x=X(1);
xdot=X(2);
y=X(3);
ydot=X(4);

dX(1,1)=xdot;
dX(2,1)=2*ydot+x-(1-mu)*(x+mu)/((x+mu)^2+y^2)^1.5-mu*(x-1+mu)/((x-1+mu)^2+y^2)^1.5;
dX(3,1)=ydot;
dX(4,1)=-2*xdot+y-(1-mu)*y/((x+mu)^2+y^2)^1.5-mu*y/((x-1+mu)^2+y^2)^1.5;