clear all;
close all;
global mu
mu=0.01;
load zerorel;

Lx0=[1-(mu/3)^(1/3),1+(mu/3)^(1/3),-1-((sqrt(2)-1)/3)*mu];
for k=1:3
    Lx(k)=fsolve(@(x) fLagrange(x,k),Lx0(k),optimset('Display','off'));
end
Lx(4)=0.5-mu;
Lx(5)=0.5-mu;

N=1000;
t=linspace(0,10*pi,N);
h=t(2)-t(1);

X0=[0.39 0 0 0.4].';
   X0=[1.09 0 0 0.1].';
   X0=[1.1368 0 0 0].'; 
   X0=[Lx(4)+0.01 0 sqrt(3)/2 0].';
   X0=[Lx(4)+0.01 0 sqrt(3)/2+0.01 0].';
   X0=[Lx(4)+0.01 0 sqrt(3)/2+0.01 0.1].';

Csurf=1/2*norm(X0([2 4]))^2-1/2*Jacobi(X0(1),X0(3),0);
[c,h]=contour(x,y,-Z,Csurf*2);
hold on;

plot(Lx(1:3),[0 0 0],'r.',Lx(4:5),[sqrt(3)/2 -sqrt(3)/2],'r*');hold on;
plot([-mu,1-mu],[0 0],'ro');
xlabel('$$x$$','Interpreter','Latex');
ylabel('$$y$$','Interpreter','Latex');
axis equal;

%return;

myoptions=odeset('RelTol',1e-6,'AbsTol',1e-6);
[t X]=ode45(@eomR3BP,t,X0,myoptions);
X=X';

plot(X(1,:),X(3,:));hold on;

