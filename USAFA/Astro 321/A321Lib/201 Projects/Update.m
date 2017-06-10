function [af,eccf,inclf,raanf,argpf,nuf]=Update(ai,ecci,incli,raani,argpi,nui,tof)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [af,eccf,inclf,raanf,argpf,nuf]=Update(ai,ecci,incli,raani,argpi,nui,tof)
%
% The function propogates the true anamaly to the future anomaly and
% leaves the other 5 COE's constant
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   Initial Values
%   ai - semimajor axis (km)
%   ecci - eccentricity
%   incli - inclination (rad)
%   raani - right ascension of the ascending node (rad)
%   argpi - argument of perigee (rad)
%   nui - true anomaly (rad) 
%
% Outputs:
%   Future Values
%   af - semimajor axis (km)
%   eccf - eccentricity
%   inclf - inclination (rad)
%   raanf - right ascension of the ascending node (rad)
%   argpf - argument of perigee (rad)
%   nuf - true anomaly (rad)
%
% Globals: MU
%
% Constants: None
%
% Coupling: newton, revcheck
% 
% References:
%   Iterative Solutions Notes from Astro 201
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global MU

% set the first 5 COE's as constants
af = ai;
eccf = ecci;
inclf = incli;
raanf = raani;
argpf = argpi;

% compute eccentric anomaly initial
Ei=acos( (ecci+cos(nui))/(1+ecci*cos(nui)) );
if nui > pi
    Ei = 2*pi - Ei;
end;

% compute mean anomaly initial
Mi = Ei - ecci*sin(Ei);

% compute mean anomaly future
n = sqrt(MU/ai^3);
Mf = Mi + n*tof;

% put this value between 0 and 2pi
Mf = revcheck(Mf,2*pi);

% compute ecentric anomaly future
Ef = newton(eccf,Mf);

%compute true anomaly future
nuf = acos( (cos(Ef)-eccf)/(1-eccf*cos(Ef)) );
if Ef > pi
    nuf = 2*pi - nuf;
end;