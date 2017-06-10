%% MAE3145 Example
%% Oct 10 2016
%% conversion between t and theat in hyperbolic orbits


clear all;
close all;

rP=6678;
vP=15;
mu=398600;

theta=100*pi/180;

h=rP*vP;
e=h^2/mu/rP-1

% theta => F => Mh => t

F=2*atanh(sqrt((e-1)/(e+1))*tan(theta/2))
Mh=e*sinh(F)-F
t=Mh/(mu^2/h^3*(e^2-1)^(3/2))

% t => Mh => F => theta

Mh=t*(mu^2/h^3*(e^2-1)^(3/2))

F=0;
eps=1e-6;
delF=2*eps;
while delF > eps
    f=e*sinh(F)-F-Mh;
    fp=e*cosh(F)-1;
    F_new=F-f/fp;
    delF=abs(F_new-F);
    disp([F F_new delF]);
    F=F_new;
end

theta=2*atan(sqrt((e+1)/(e-1))*tanh(F/2))