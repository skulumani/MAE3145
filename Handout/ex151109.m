%% Lambert Problem Example

clear all;
close all;
mu=398600;
rA=18900;
rP=8100;
thetaB=45*pi/180;
thetaC=150*pi/180;

a=1/2*(rP+rA)
e=(rA-rP)/(rA+rP)
tC = theta2t(thetaC,a,e,mu)
tD=tC+3600;
thetaD=t2theta(tD,a,e,mu)

h=sqrt(mu*a*(1-e^2));
rB=h^2/mu/(1+e*cos(thetaB))
rB_vec=rB*[cos(thetaB) sin(thetaB)]
rD=h^2/mu/(1+e*cos(thetaD))
rD_vec=rD*[cos(thetaD) sin(thetaD)]

vB1_vec=mu/h*[-sin(thetaB) e+cos(thetaB)]
vD1_vec=mu/h*[-sin(thetaD) e+cos(thetaD)]

[vB2_vec vD2_vec a2 e2 h2]=LambertProb(rB_vec,rD_vec,3600,mu)

delVB_vec=vB2_vec-vB1_vec
delVD_vec=vD1_vec-vD2_vec

delV_total=norm(delVB_vec)+norm(delVD_vec)