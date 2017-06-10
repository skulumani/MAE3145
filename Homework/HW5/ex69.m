clear all;
close all;

ra=18900;
rp=8100;

thetaB=pi/4
thetaC=5/6*pi

mu=398600;

% Position and Velocity at B
e1=(ra-rp)/(ra+rp)
h1=sqrt(rp*mu*(1+e1))
rB=h1^2/mu/(1+e1*cos(thetaB))

rB_vec=rB*[cos(thetaB) sin(thetaB)]
vB1_vec=mu/h1*[-sin(thetaB) e1+cos(thetaB)]

% Compute thetaCp

EC=2*atan(sqrt((1-e1)/(1+e1))*tan(thetaC/2))
MeC=EC-e1*sin(EC)
a1=1/2*(ra+rp)
T1=2*pi/sqrt(mu)*a1^(3/2)
tC=MeC/2/pi*T1

tCp=tC+3600
MeCp=2*pi*tCp/T1

E=MeCp;
errE=1;
while errE > 1e-15
    Enew=E-(E-e1*sin(E)-MeCp)/(1-e1*cos(E));
    errE=norm(Enew-E);
    E=Enew;
end
thetaCp=2*atan(sqrt((1+e1)/(1-e1))*tan(E/2))


% Position and Velocity at Cp
rCp=h1^2/mu/(1+e1*cos(thetaCp))
rCp_vec=rCp*[cos(thetaCp) sin(thetaCp)]
vCp1_vec=mu/h1*[-sin(thetaCp) e1+cos(thetaCp)]


% Lambert Problem from rB to rCp 
[vB2_vec vCp2_vec]=LambertProb(rB_vec,rCp_vec,3600,mu)


% Compute velocity change

delvB=vB2_vec-vB1_vec
delvCp=vCp1_vec-vCp2_vec

