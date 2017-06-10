clear all;
close all;

mu=398600;
rA=6800
rC=13600
thetaB=pi/2;

% compute tBA

e1=(rC-rA)/(rC+rA)

EB=2*atan(sqrt((1-e1)/(1+e1))*tan(thetaB/2))
MeB=EB-e1*sin(EB)
a1=1/2*(rA+rC)
T1=2*pi/sqrt(mu)*a1^(3/2)
tAB=MeB/2/pi*T1

% Design the phasing orbit

tBA=T1-tAB
a2=(tBA/2/pi*sqrt(mu))^(2/3)
T2=2*pi/sqrt(mu)*a2^(3/2)
rD=2*a2-rA

% Compute delta V

vA2=sqrt(2*mu/(rA+rD)*rD/rA)
vA1=sqrt(2*mu/(rA+rC)*rC/rA)
delVA_1=vA2-vA1
delVA_2=vA1-vA2

delv_total=abs(delVA_1)+abs(delVA_2)
T2