clear all
close all

v=5
gamma=30*pi/180
RE=6378
mu=398600


r=RE

E=1/2*v^2-mu/r
h=r*v*cos(gamma)

e=sqrt(2*E*h^2/mu^2+1)

theta=acos(1/e*(h^2/mu/r-1))