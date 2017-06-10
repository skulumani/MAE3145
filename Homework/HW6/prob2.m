clear all;
close all;

RE=149.6e6;
RM=227.9e6;

muE=398600;
muM=42830;
muS=132.71e9;

mE=5.974e24;
mM=6.419e23;
mS=1.989e30;

thetaM=358.13*pi/180;
thetaE=230.81*pi/180;

TM=2*pi/sqrt(muS)*RM^(3/2);
TE=2*pi/sqrt(muS)*RE^(3/2);

nM=2*pi/TM
nE=2*pi/TE

% (a)
phi_t0=thetaM-thetaE
disp(nM-nE)

% (b)
a3=1/2*(RE+RM);
T3=2*pi/sqrt(muS)*a3^(3/2);
tDA=T3/2;
phi_0=pi-nM*tDA
disp(phi_0*180/pi);

% (c)

for k=1:6;
    td(k)=(phi_0-2*pi*k-phi_t0)/(nM-nE)/3600/24;
end
disp('td_k');
disp(td');

k=6
td=td(6)

% (d)
disp('Saturday, December 17, 2016');
