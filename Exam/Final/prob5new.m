clear all;
close all;
global mu;

mE=5.9742e24;
mM=7.348e22;

%mu=mM/(mE+mM)
mu=0.01;

Lx0=[1-(mu/3)^(1/3),1+(mu/3)^(1/3),-1-((sqrt(2)-1)/3)*mu];
for k=1:3
    Lx(k)=fsolve(@(x) fLagrange(x,k),Lx0(k),optimset('Display','on'));
end
Lx(4)=0.5-mu;
Lx(5)=0.5-mu;

Ly=[0 0 0 sqrt(3)/2 -sqrt(3)/2];

disp(Lx)
disp(Ly)

for k=1:5
    x=Lx(k);y=Ly(k);
    r1=sqrt((x+mu)^2+y^2);
    r2=sqrt((x-1+mu)^2+y^2);
    C(k)=-1/2*(x^2+y^2)-(1-mu)/r1-mu/r2;
end
disp(C)

Lx=[0.5 0.2 0.18];
Ly=[0.5 0.18 0.2];
Lxdot=[0 1.121 1.801];
Lydot=[0 1.685 1];

for k=1:3
    x=Lx(k);y=Ly(k);xdot=Lxdot(k);ydot=Lydot(k);
    r1=sqrt((x+mu)^2+y^2);
    r2=sqrt((x-1+mu)^2+y^2);

Cs(k)=1/2*(xdot^2+ydot^2)-1/2*(x^2+y^2)-(1-mu)/r1-mu/r2;
end

disp(Cs)
