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

disp('(a)');
rSOI_M=(mM/mS)^(2/5)*RM
rSOI_M/RM

disp('(b)');
VA2=sqrt(muS/RM);
VA3=sqrt(2*muS/(RE+RM)*RE/RM);
v_inf=VA2-VA3

disp('(c)');
rp=3396;

h=rp*sqrt(v_inf^2+2*muM/rp)
e=1+rp*v_inf^2/muM

disp('(d)');
vp=h/rp

disp('(e)');
beta=acos(1/e)
beta*180/pi
angle=pi/2-beta
angle*180/pi

disp('(f)');
Delta=h^2/muM/sqrt(e^2-1)