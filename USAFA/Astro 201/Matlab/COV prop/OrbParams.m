function [rp, ra,sme, period]=OrbParams(a, ecc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [rp, ra,sme, period]=OrbParams(a, ecc)
% 
% This program calculate several other values of an orbit given the
% eccentricity and semimajor axis
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    a - semimajor axis km
%    ecc - eccentricity
%
% Outputs:
%    rp - radius of perigee km
%    ra - radius of apogee
%    sme - specific mechanical energy
%    period - period hours
% 
% Globals: 
%    MU - combination of the radius of the earth and the universal
%    gravitational constant
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 RV2COE project
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global MU

% Calculate the radius of perigee
rp = a*(1-ecc);

% Calculate the radius of apogee
ra = a*(1+ecc);

% Calculate the specific mechanical energy
sme = -MU/(2*a);

% Calculate the period
period = ((2*pi)*sqrt((a^3)/MU));
