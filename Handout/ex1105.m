clear all;
close all;

RE=149.6e6;
RM=227.9e6;
muS=132.71e9;

T1=2*pi/sqrt(muS)*RE^(3/2);
T2=2*pi/sqrt(muS)*RM^(3/2);
a3=1/2*(RE+RM);
T3=2*pi/sqrt(muS)*a3^(3/2);

n1=2*pi/T1;
n2=2*pi/T2;

t12=T3/2
phi0=pi-n2*t12
phif=pi-n1*t12

N=-1;
twait=(-2*phif+2*pi*N)/(n2-n1)

ttotal=2*t12+twait