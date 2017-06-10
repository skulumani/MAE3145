function t = theta2t(theta,a,e,mu)
% convert theta into time for elliptic orbit

E=2*atan(sqrt((1-e)/(1+e))*tan(theta/2));
Me=E-e*sin(E);
T=2*pi/sqrt(mu)*a^(3/2);
t=Me/2/pi*T;
