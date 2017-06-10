%HW#1 Prob 2

ra=70000;
rp=7000;
mu=398600;
RE=6378;

e=(ra-rp)/(ra+rp)

a=1/2*(ra+rp)

T=2*pi/sqrt(mu)*a^(3/2)

E=-mu/2/a

r=RE+1000;
theta=acos((a*(1-e^2)/r-1)/e)
theta*180/pi

h=sqrt(mu*a*(1-e^2))

v_r=mu/h*e*sin(theta)
v_theta=mu/h*(1+e*cos(theta))