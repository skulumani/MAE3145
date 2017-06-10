function [delV delT]=Hohmann(rA,rC)
mu=398600;

VA1=sqrt(mu/rA);
VA2=sqrt(2*mu/(rA+rC)*rC/rA);
delVA=VA2-VA1;

VC2=sqrt(2*mu/(rA+rC)*rA/rC);
VC3=sqrt(mu/rC);
delVC=VC3-VC2;

delV=abs(delVA)+abs(delVC);

a2=1/2*(rA+rC);
T2=2*pi/sqrt(mu)*a2^(3/2);
delT=T2/2;