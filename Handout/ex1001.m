clear all;
close all;

% Elliptic orbit

rp=9600;
ra=21000;
mu=398600;

% Find t for a given theta

theta=120*pi/180;
e=(ra-rp)/(ra+rp)
E=2*atan(sqrt((1-e)/(1+e))*tan(theta/2))
Me=E-e*sin(E)

a=1/2*(ra+rp)
T=2*pi/sqrt(mu)*a^(3/2)
t=Me/2/pi*T

% Find theta for a given t

Me=t*2*pi/T

E=Me; %initial guess
eps=1e-10;
delE=2*eps;
while delE > eps
    f=E-e*sin(E)-Me;
    fp=1-e*cos(E);
    Enew=E-f/fp;
    delE=abs(Enew-E);
    disp([E Enew delE]);
    E=Enew;
end

theta=2*atan(sqrt((1+e)/(1-e))*tan(E/2))
