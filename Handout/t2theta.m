function theta=t2theta(t,a,e,mu)
% convert t into theta for elliptic orbit

T=2*pi/sqrt(mu)*a^(3/2);
Me=t/T*2*pi;
E=Me;   % initial guess of E
eps=1e-10;  % iteration tolerance
delE=2*eps;
while delE > eps
    f=E-e*sin(E)-Me;
    fp=1-e*cos(E);
    Enew=E-f/fp;
    delE=abs(Enew-E);
    E=Enew;
end
theta=2*atan(sqrt((1+e)/(1-e))*tan(E/2));
