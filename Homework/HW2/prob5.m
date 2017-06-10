clear all;
close all;

T=15.743*3600;
rp=12756;

mu=398600;
a=(T*sqrt(mu)/2/pi)^(2/3);
e=1-rp/a
t=1*3600;
Me=2*pi/T*t

E=Me;
errE=1;
while errE > 1e-15
    f=(E-e*sin(E)-Me);
    fp=1-e*cos(E);
    Enew=E-f/fp;
    errE=norm(Enew-E);
    E=Enew;
end

E

theta=2*atan(sqrt((1+e)/(1-e))*tan(E/2));
disp(theta*180/pi);



