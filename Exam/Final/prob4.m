close all;
clear all;

muS = 1.327e11;
RE=149.6e6;
RV=108.2e6;
muV=324900;
mV=4.869e24
mS=1.989e30;


a=1/2*(RE+RV)
T=2*pi/sqrt(muS)*a^(3/2)
tEV=T/2

TV=2*pi/sqrt(muS)*RV^(3/2)
nV=2*pi/TV
phi0=pi-nV*tEV