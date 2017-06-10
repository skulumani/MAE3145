function [delV delT]=BEHohmann(rA,rB,rC)
mu=398600;

VA1=sqrt(mu/rA);
VA2=sqrt(2*mu/(rA+rB)*rB/rA);
delVA=VA2-VA1;

VB3=sqrt(2*mu/(rC+rB)*rC/rB);
VB2=sqrt(2*mu/(rA+rB)*rA/rB);
delVB=VB3-VB2;

VC4=sqrt(mu/rC);
VC3=sqrt(2*mu/(rB+rC)*rB/rC);
delVC=VC4-VC3;

delV=abs(delVA)+abs(delVB)+abs(delVC);

a2=1/2*(rA+rB);
T2=2*pi/sqrt(mu)*a2^(3/2);
tAB=T2/2;

a3=1/2*(rB+rC);
T3=2*pi/sqrt(mu)*a3^(3/2);
tBC=T3/2;

delT=tAB+tBC;
