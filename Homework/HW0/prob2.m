clear all;
close all;

uA=[1 1.5 -0.5];uA=uA/norm(uA);
uB=[-0.2 3 1];uB=uB/norm(uB);

R=7000;

rA=R*uA
rB=R*uB

theta=acos(dot(uA,uB))

h=cross(uA,uB)
h=h/norm(h)

