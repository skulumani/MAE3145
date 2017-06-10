clear all;
close all;

RE=6378;
r=6378+422;
vr=-0.3;
mu=398600

vtheta=sqrt(mu/r)

v=sqrt(vr^2+vtheta^2)

E=1/2*v^2-mu/r

h=r*vtheta

e=sqrt(2*E*h^2/mu^2+1)

rP=h^2/mu/(1+e)