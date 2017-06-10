clear all;

rP=8100
rA=18900
mu=398600

thetaB=45*pi/180
thetaC=150*pi/180

%% Find rD

e=(rA-rP)/(rA+rP)
a=1/2*(rA+rP)
tC=theta2t(thetaC,a,e,mu)
tD=tC+3600

thetaD=t2theta(tD,a,e,mu)

%% Solve Lambert problem from B to D

h=sqrt(mu*a*(1-e^2))
rB=h^2/mu/(1+e*cos(thetaB))
rB_vec=rB*[cos(thetaB) sin(thetaB)]

rD=h^2/mu/(1+e*cos(thetaD))
rD_vec=rD*[cos(thetaD) sin(thetaD)]

[vB2_vec vD2_vec a2 e2 h2]=LambertProb(rB_vec,rD_vec,3600,mu)

%% Compute delta V

vB1_vec=mu/h*[-sin(thetaB) e+cos(thetaB)]
vD1_vec=mu/h*[-sin(thetaD) e+cos(thetaD)]

% at B : 1 => 2
delvB=vB2_vec-vB1_vec

% at D : 2 => 1
delvD=vD1_vec-vD2_vec


delv_total=norm(delvB)+norm(delvD)





