clear all;
close all;

rA=6800;
rC=13600;
mu=398600;

thetaB=pi/2;
e1=(rC-rA)/(rA+rC)
EB=2*atan(sqrt((1-e1)/(1+e1))*tan(thetaB/2))
MeB=EB-e1*sin(EB)

a1=1/2*(rA+rC)
T1=2*pi/sqrt(mu)*a1^(3/2)
tAB=MeB/2/pi*T1

tBA=T1-tAB

a2=(tBA*sqrt(mu)/2/pi)^(2/3)
rD=2*a2-rA
e2=(rD-rA)/(rD+rA)

vA2=sqrt(2*mu/(rA+rD)*rD/rA)
vA1=sqrt(2*mu/(rA+rC)*rC/rA)
delVA=vA2-vA1