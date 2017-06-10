clear all;

rA=18900;
rP=8100;
mu=398600;

thetaB=45*pi/180;
thetaC=150*pi/180;

e1=(rA-rP)/(rA+rP)
a1=1/2*(rA+rP)

tC=theta2t(thetaC,a1,e1,mu)
tD=tC+3600
thetaD=t2theta(tD,a1,e1,mu)

h1=sqrt(mu*a1*(1-e1^2))
rD=h1^2/mu/(1+e1*cos(thetaD))
rD_vec=rD*[cos(thetaD) sin(thetaD)]

rB=h1^2/mu/(1+e1*cos(thetaB))
rB_vec=rB*[cos(thetaB) sin(thetaB)]

[vB2_vec vD2_vec a2 e2 h2]=LambertProb(rB_vec,rD_vec,3600,mu)

vB1_vec=mu/h1*[-sin(thetaB) e1+cos(thetaB)]
vD1_vec=mu/h1*[-sin(thetaD) e1+cos(thetaD)]

delVB=vB2_vec-vB1_vec
delVD=vD1_vec-vD2_vec

delV_total=norm(delVB)+norm(delVD)