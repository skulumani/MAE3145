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
rSOI_E=(mE/mS)^(2/5)*RE

disp('(b)');
VD1=sqrt(muS/RE);
VD3=sqrt(2*muS/(RE+RM)*RM/RE);
v_inf=VD3-VD1

disp('(c)');
rp=9000;
h=rp*sqrt(v_inf^2+2*muE/rp)
e=1+rp*v_inf^2/muE

disp('(d)');
vp=h/rp;
vc=sqrt(muE/rp);
delv=vp-vc

disp('(e)');

beta=acos(1/e)
beta*180/pi
angle=beta+pi/2
angle*180/pi
