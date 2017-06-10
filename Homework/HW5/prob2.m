clear all;
close all;
mu=398600;

ra=13000;
rp=8000;

% (a) Position and Velocity at P
e1=(ra-rp)/(ra+rp);
h1=sqrt(rp*mu*(1+e1));

rP_vec=[rp 0]
vP1_vec=[0 h1/rp]

% (b) Position and Velocity at D

thetaD=pi/2;
rD=h1^2/mu/(1+e1*cos(thetaD));

rD_vec=rD*[cos(thetaD) sin(thetaD)]
vD1_vec=mu/h1*[-sin(thetaD) (e1+cos(thetaD))]

% (c) Time at D
ED=2*atan(sqrt((1-e1)/(1+e1))*tan(thetaD/2));
MeD=ED-e1*sin(ED);
a1=1/2*(ra+rp);
T1=2*pi/sqrt(mu)*a1^(3/2);
tD=MeD/2/pi*T1

% Time at C
thetaC=30*pi/180;
EC=2*atan(sqrt((1-e1)/(1+e1))*tan(thetaC/2));
MeC=EC-e1*sin(EC);
tC=MeC/2/pi*T1

tPD=tD-tC

% (d) Lambert Problem
[vP2_vec vD2_vec]=LambertProb(rP_vec,rD_vec,tPD,mu)

% (e)
delvP=vP2_vec-vP1_vec
delvD=vD1_vec-vD2_vec

% (f)
delV=norm(delvP)+norm(delvD)