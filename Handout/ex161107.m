clear all;
close all;

mu=398600;
rA=6800;
rC=13600;

%% Design of the phasing orbit
a1=1/2*(rA+rC)
T1=2*pi/sqrt(mu)*a1^(3/2)

thetaB=pi/2

e1=(rC-rA)/(rC+rA)
tAB = theta2t(thetaB,a1,e1,mu)

tBA=T1-tAB

T2=tBA
a2=(sqrt(mu)/2/pi*T2)^(2/3)

rD=2*a2-rA

%% delta V

vA2=sqrt(2*mu/(rA+rD)*rD/rA)
vA1=sqrt(2*mu/(rA+rC)*rC/rA)
delVA=vA2-vA1

delV_total=abs(delVA)*2
