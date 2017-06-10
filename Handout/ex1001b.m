clear all;
close all;

rp=6678;
vp=15;
mu=398600;

% Find the type of orbit
h=rp*vp
e=h^2/mu/rp-1

% Convert theta into t for a hyperbolic orbit
theta=100*pi/180;

F=2*atanh(sqrt((e-1)/(e+1))*tan(theta/2))
Mh=e*sinh(F)-F

t=Mh/(mu^2/h^3*(e^2-1)^(3/2))

theta_inf=acos(-1/e)