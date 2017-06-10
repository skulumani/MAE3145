%% MAE3145 Example
%% Oct 5 2016
%% conversion between t and theat in elliptic orbits

clear all;
close all;

rP=9600;
rA=21000;
mu=398600;

e=(rA-rP)/(rA+rP)
a=rP/(1-e)
T=2*pi/sqrt(mu)*a^(3/2)

%% theta => E => Me => t

theta=120*pi/180

E=2*atan(sqrt((1-e)/(1+e))*tan(theta/2))
Me=E-e*sin(E)

t=Me/2/pi*T

%% t=> Me => E => theta

Me=t/T*2*pi
E=0;
eps=1e-6;
delE=2*eps;
while delE > eps
    f=E-e*sin(E)-Me;
    fp=1-e*cos(E);
    E_new=E-f/fp;
    delE=abs(E_new-E);
    disp([E E_new delE]);
    E=E_new;    
end
theta=2*atan(sqrt((1+e)/(1-e))*tan(E/2))

    
