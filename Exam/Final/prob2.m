clear all;
close all;

mu=398600
rA=8000
e2=0.4

rB=(1+e2)/(1-e2)*rA
a2=1/2*(rA+rB)

b2=sqrt(1-e2^2)*a2
T2=2*pi/sqrt(mu)*a2^(3/2)

T3=T2/2
a3=(T3*sqrt(mu)/2/pi)^(2/3)
rC=2*a3-rA

vA3=sqrt(2*mu/(rA+rC)*rC/rA)
vA1=sqrt(mu/rA)
delVA=vA3-vA1

vA2=sqrt(2*mu/(rA+rB)*rB/rA)
delVAp=vA2-vA3

delVT=abs(delVA)+abs(delVAp)
