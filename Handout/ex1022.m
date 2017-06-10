clear all;
close all;

rA=11378;
vA=10;
rB=6878;
mu=398600;

vA2=sqrt(2*mu/(rA+rB)*rB/rA)
vA1=10
delvA=vA2-vA1

vB3=sqrt(mu/rB)
vB2=sqrt(2*mu/(rA+rB)*rA/rB)
delvB=vB3-vB2

delv_total=abs(delvA)+abs(delvB)

a2=1/2*(rA+rB)
T2=2*pi/sqrt(mu)*a2^(3/2)
tAB=1/2*T2
