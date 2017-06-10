clear all;
close all;

RE=149.6e6;
RM=227.9E6;
mu=132.71e9;

T1=2*pi/sqrt(mu)*RE^(3/2)
T2=2*pi/sqrt(mu)*RM^(3/2)
n1=2*pi/T1
n2=2*pi/T2

a3=1/2*(RE+RM)
T3=2*pi/sqrt(mu)*a3^(3/2)
t12=T3/2

phi_0=pi-n2*t12
phi_f=pi-n1*t12

N=-1;
t_wait=(-2*phi_f+2*pi*N)/(n2-n1)