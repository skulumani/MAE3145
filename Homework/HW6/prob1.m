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

% (a)
VA3=sqrt(2*muS/(RE+RM)*RE/RM)
VA2=sqrt(muS/RM)

% (b)
VD1=sqrt(muS/RE)
VD3=sqrt(2*muS/(RE+RM)*RM/RE)

% (c)
a3=1/2*(RE+RM);
T3=2*pi/sqrt(muS)*a3^(3/2);
tDA=T3/2
