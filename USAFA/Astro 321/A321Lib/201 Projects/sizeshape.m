function [a,ecc]=sizeshipe(R,V,E)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [a,ecc]=sizeshipe(R,V,E)
%
% The function computes the semimajor axis and eccentricity
% of the orbit.
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   R - position vector (km)
%   V - velocity vector (km/s)%     
%   E - the eccentricity vector
%
% Outputs:
%   a - semimajor axis (km)
%   ecc - eccentricity
%
% Globals: MU
%
% Constants: None
%
% Coupling: mag
% 
% References:
%   "Understanding Space", Sellers Chapter 5
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global MU

% Compute semimajor axis (first get specific mech energy)
r=mag(R);
v=mag(V);
sme = v^2/2 - MU/r;
a = -MU/(2*sme);

% Compute the eccentricity

ecc = mag(E);
