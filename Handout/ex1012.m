clear all;
close all;

rp=6678;
vp=15;
mu=398600;

h=rp*vp
e=h^2/mu/rp-1

%% theta => F => Mh => t
theta=100*pi/180;
F=2*atanh(sqrt((e-1)/(e+1))*tan(theta/2))
Mh=e*sinh(F)-F
t=Mh/(mu^2/h^3*(e^2-1)^(3/2))


%% t => Mh => F => theta
tB=t+3600*3;
Mh=tB*mu^2/h^3*(e^2-1)^(3/2)

F=Mh;
delF=1;
eps=1e-6;
while delF > eps
    f=e*sinh(F)-F-Mh;
    fp=e*cosh(F);
    Fnew=F-f/fp;
    delF=abs(F-Fnew);
    F=Fnew;
end
theta=2*atan(sqrt((e+1)/(e-1))*tanh(F/2))