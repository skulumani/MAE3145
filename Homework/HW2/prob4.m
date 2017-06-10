clear all;
close all;

E=10;
h=8e4;
mu=398600;

a=mu/2/E
e=sqrt(1+2*h^2/mu^2*E)
theta_inf=acos(-1/e)
v_inf=sqrt(mu/a);


%e=1.43978
theta=100*pi/180;
F=log((sqrt(e+1)+sqrt(e-1)*tan(theta/2))/(sqrt(e+1)-sqrt(e-1)*tan(theta/2)))
F=2*atanh(sqrt((e-1)/(e+1))*tan(theta/2))

Mh=e*sinh(F)-F

t=Mh*h^3/mu^2/(e^2-1)^(3/2)
