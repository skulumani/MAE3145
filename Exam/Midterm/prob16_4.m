clear all;
close all;
mu=398600%%
%mu=400000;

rp=8000
ra=rp*4

e=(ra-rp)/(ra+rp)
a=(ra+rp)/2

E=-mu/2/a
h=sqrt(mu*a*(1-e^2))

T=2*pi/sqrt(mu)*a^(3/2)
T/3600
TAP=T/2
TAP/3600

theta=pi/2;

E=2*atan(sqrt((1-e)/(1+e))*tan(theta/2))
%E*180/pi


Me=E-e*sin(E)

TPC=Me*T/2/pi
TPC/3600

TCD=TPC*2
TCD/3600