function [n,ecc,raan,argp,nu]=Update(deltat,n0,ndot2,ecc0,eccdot,raan0,raandot,argp0,argdot,mean0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [n,ecc,raan,argp,nu]=Update(deltat,n0,ndot2,ecc0,eccdot,raan0,raandot,argp0,argdot,mean0)
% 
% This procedure uses the method of general perturbations to update
% classical elements from epoch to a future time for inclined elliptical
% orbits.  It includes the effects due to first order secular rates (second
% order for mean motion) caused by drag and J2.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    deltat - elapsed time since epoch (sec)
%    n0 - mean motion at epoch (rad/sec)
%    ndot2 - mean motion rate divided by 2 (rad/sec^2)
%    ecc0 - eccentricity at epoch (unitless)
%    eccdot - eccentricity rate (1/sec)
%    raan0 - RAAN at epoch (rad)
%    raandot - RAAN rate (rad/sec)
%    argp0 - argument of periapsis at epoch (rad)
%    argdot - argument of periapsis rate (rad/sec)
%    mean0 - mean anomaly at epoch
%
% Outputs:
%    n - mean motion at epoch + deltat (rad/sec)
%    ecc -  eccentricity at epoch + deltat (unitless)
%    raan - RAAN at epoch + deltat (rad)
%    argp - argument of periapsis at epoch + deltat (rad)
%    nu -  true anomaly at epoch + deltat (rad)
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: 
%    newton.m
%
% References:
%    Astro 321 PREDICT LSN 24-25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate mean motion at future time
n=n0+ndot2*2*deltat;

% Calculate eccentricity at future time
ecc=ecc0+eccdot*deltat;

% Calculate RAAN at future time
raan=raan0+raandot*deltat;

% Calculate argument of periapsis at future time
argp=argp0+argdot*deltat;

% Calculate true anomaly at future time
mean=mean0+n0*deltat+ndot2*deltat^2;
mean=revcheck(mean,2*pi);

E=newton(mean,ecc);
E=revcheck(E,2*pi);

nu=acos((cos(E)-ecc)/(1-ecc*cos(E)));

% Half plane check
if E > pi 
    nu=2*pi-nu;
end
