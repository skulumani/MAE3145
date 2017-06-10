clear all;
close all;
mu=398600;

rA=7000;
thetaA=210*pi/180;
vA=sqrt(mu/rA);
h1=rA*vA;
e1=0;
rB=6378;
thetaB=0*pi/180;

% (a)
vA1_vec=mu/h1*[-sin(thetaA) (e1+cos(thetaA))]

% (b)
e2=(rB-rA)/(rA*cos(thetaA)-rB*cos(thetaB))
h2=sqrt(mu*rA*rB)*sqrt((cos(thetaA)-cos(thetaB))/(rA*cos(thetaA)-rB*cos(thetaB)))

% (c)
vA2_vec=mu/h2*[-sin(thetaA) (e2+cos(thetaA))]

% (d)
delvA_vec=vA2_vec-vA1_vec

% (e)
vB3_vec=mu/h2*[-sin(thetaB) (e2+cos(thetaB))]
