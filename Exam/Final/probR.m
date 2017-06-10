clear all;
close all;

rho=2;

i=linspace(0.1,pi,10000);


for k=1:10000
R(k)=sqrt(2/rho/(1+rho))+1/sin(i(k)/2)*(sqrt(2*rho/(1+rho))-1);
end

plot(i,R)

A=sqrt(2/rho/(1+rho))
B=(sqrt(2*rho/(1+rho))-1)

i=2*asin(B/(1-A))

A+B/sin(i/2)

sqrt(2/rho/(1+rho))+1/sin(i/2)*(sqrt(2*rho/(1+rho))-1)
