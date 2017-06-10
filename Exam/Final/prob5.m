clear all;
close all;

beta=40*pi/180
e=1/cos(beta)
rp=0.4
Delta=rp*sqrt(1+2/(e-1))

a=rp/(e-1);
a+rp

C=(a+rp)*[sin(beta) -cos(beta)]

sqrt(3^2-C(1)^2)

C+(norm(C)+3)*[-sin(beta) cos(beta)]

C+4.1*[-sin(2*beta) cos(2*beta)]

C+4.8*[-sin(2*beta) cos(2*beta)]

P=0.8*(a+rp)*[sin(beta) -cos(beta)]

clear all;
clc

muS = 1.327e11;
RE=149.6e6;
RV=108.2e6;
muV=324900;
mV=4.869e24
mS=1.989e30;

rSOI_V=RV*(mV/mS)^(2/5)

VA1=sqrt(2*muS/(RE+RV)*RE/RV)
VA1_vec=[0 VA1]

V=sqrt(muS/RV)
V_vec=[0 V]

vinf1_vec=VA1_vec-V_vec
vinf1=norm(vinf1_vec)

% beta=40*pi/180;
% e=1/cos(beta);
% rp=(e-1)*muV/vinf1^2;


rp=13537.9
e=1+rp*vinf1^2/muV
beta=acos(1/e)

vinf2_vec=vinf1*[-sin(2*beta) -cos(2*beta)]
VA2_vec=vinf2_vec+V_vec

VA2=norm(VA2_vec)

h2=VA2_vec(2)*RV
E2=1/2*VA2^2-muS/RV
e2=sqrt(1+2*E2/muS^2*h2^2)


h1=VA1_vec(2)*RV
E1=1/2*VA1^2-muS/RV
e1=sqrt(1+2*E1/muS^2*h1^2)