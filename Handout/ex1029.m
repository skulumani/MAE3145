clear all;
close all;

rP=8100;
rA=18900;
mu=398600;
thetaB=45*pi/180;
thetaC=150*pi/180;

% Step A: find rD_vec

a1=1/2*(rA+rP);
e1=(rA-rP)/(rA+rP);
tC=theta2t(thetaC,a1,e1,mu)
tD=tC+3600
thetaD=t2theta(tD,a1,e1,mu)
h1=sqrt(mu*a1*(1-e1^2));
rD=h1^2/mu/(1+e1*cos(thetaD));
rD_vec=rD*[cos(thetaD) sin(thetaD)]

% Step B: Lambert Problem from B to D in 1hr

rB=h1^2/mu/(1+e1*cos(thetaB));
rB_vec=rB*[cos(thetaB) sin(thetaB)]
tBD=3600;
[vB2_vec vD2_vec a2 e2 h2]=LambertProb(rB_vec,rD_vec,tBD,mu)

% Step C: Compute delta V
vB1_vec=mu/h1*[-sin(thetaB) (e1+cos(thetaB))]
delVB_vec=vB2_vec-vB1_vec

vD1_vec=mu/h1*[-sin(thetaD) (e1+cos(thetaD))]
delVD_vec=vD1_vec-vD2_vec

delV_total=norm(delVB_vec)+norm(delVD_vec)

