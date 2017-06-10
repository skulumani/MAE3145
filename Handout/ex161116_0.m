close all;
close all;

RE=149.6e6;
RM=227.9e6;
mu=132.71e9;

r1=RE;
T1=2*pi/sqrt(mu)*r1^(3/2)
n1=2*pi/T1

r2=RM
T2=2*pi/sqrt(mu)*r2^(3/2)
n2=2*pi/T2

a3=1/2*(r1+r2)
T3=2*pi/sqrt(mu)*a3^(3/2)
t12=T3/2

phi0=pi-n2*t12
phif=pi-n1*t12

N=-1
t_wait=(-2*phif+2*pi*N)/(n2-n1)

t_total=2*t12+t_wait