function [raandot,argdot,eccdot]=J2DragPert(inc0,ecc0,n0,ndot2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [raandot,argdot,eccdot]=J2DragPert(inc0,ecc0,n0,ndot2)
% 
% This file calculates the rates of change of the right ascension of the
% ascending node(raandot), argument of periapsis(argdot), and
% eccentricity(eccdot).  The perturbations are limited to J2 and drag only.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    inc0 - initial inclination (radians)
%    ecc0 - initial eccentricity (unitless)
%    n0 - initial mean motion (rad/sec)
%    ndot2 - mean motion rate divided by 2 (rad/sec^2)
%
% Outputs:
%    raandot - nodal rate (rad/sec)
%    argdot - argument of periapsis rate (rad/sec)
%    eccdot - eccentricity rate (1/sec)
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define Global variables
global MU RE J2;

% Calculate initial semi major axis and parameter
a0=(MU/(n0^2))^(1/3);
p0=a0*(1-ecc0^2);

% Calculate mean motion with J2
nvec=n0*(1+1.5*J2*(RE/p0)^2*sqrt(1-ecc0^2)*(1-1.5*sin(inc0)^2));

% Calculate eccentricity rate
eccdot=(-2*(1-ecc0)*2*ndot2)/(3*nvec);

% Calculate nodal rate
raandot=(-1.5*J2*(RE/p0)^2*cos(inc0))*nvec;

% Calculate argument of periapsis rate
argdot=(1.5*J2*(RE/p0)^2*(2-2.5*sin(inc0)^2))*nvec;




