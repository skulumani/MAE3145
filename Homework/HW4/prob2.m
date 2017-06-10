%% HW#4 Question 3

clear all;
close all;

mu=398600;

rA=7000;
rB=14000;
vA1=12;

%% a

E1=1/2*vA1^2-mu/rA;
h1=vA1*rA;

e1=sqrt(2*E1*h1^2/mu^2+1);
a1=h1^2/mu/(e1^2-1);

vA2=sqrt(2*mu/(rA+rB)*rB/rA);
delVA=vA2-vA1

%% b

a2=1/2*(rA+rB);
T2=2*pi/sqrt(mu)*a2^(3/2);
t1=T2/2

%% c

T4=2*pi/sqrt(mu)*rB^(3/2);
thetaC=t1/T4*2*pi

t2=T4

%% d
T3=t2-t1
a3=(T3*sqrt(mu)/2/pi)^(2/3)
% check T3=2*pi/sqrt(mu)*a3^(3/2)

rC=2*a3-rB

%% e

vB3=sqrt(2*mu/(rB+rC)*rC/rB)
vB2=sqrt(2*mu/(rA+rB)*rA/rB)
delVB1=vB3-vB2

%% f

vB4=sqrt(mu/rB)
delVB2=vB4-vB3

%% g

delVT=abs(delVA)+abs(delVB1)+abs(delVB2)

