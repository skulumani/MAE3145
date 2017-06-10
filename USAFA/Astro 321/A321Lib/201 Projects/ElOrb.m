function [a,ecc,incl,raan,argp,nu]=ElOrb(R,V)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [a,ecc,incl,raan,argp,nu]=ElOrb(R,V)
%
% The function computes the 6 orbital elements from a
% position and velocity.
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   R - position vector (km)
%   V - velocity vector (km/s)%   
%
% Outputs:
%   a - semimajor axis (km)
%   ecc - eccentricity
%   incl - inclination (rad)
%   raan - right ascension of the ascending node (rad)
%   argp - argument of perigee (rad)
%   nu - true anomaly (rad)
%
% Globals: None
%
% Constants: None
%
% Coupling: hnevec, sizeshape, angles
% 
% References:
%   "Understanding Space", Sellers Chapter 5
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compute needed vectors

[H,N,E]=hnevec(R,V);

% Compute the size and shape of the orbit

[a,ecc]=sizeshape(R,V,E);

% Compute the last four angular COE's

[incl,raan,argp,nu]=angles(R,V,H,N,E);

