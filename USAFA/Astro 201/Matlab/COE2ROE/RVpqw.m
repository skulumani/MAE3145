function [Rpqw,Vpqw]=RVpqw(af,eccf,nuf)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [Rpqw,Vpqw]=RVpqw(af,eccf,nuf)
% 
% This function takes the inputed a,ecc, and nu and calculates the
% associated R and V vectors in the PQW coordinate system.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    af - semi-major axis at final TOF km
%    eccf - eccentricity at final TOF 
%    nuf - true anomaly at final TOF rad
%
% Outputs:
%    Rpqw - positon vector in PQW coordinate system km
%    Vpqw - velocity vector in PQW coordinate system km/sec
% 
% Globals: 
%    MU
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 Lesson 22 COE2RV 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global MU

% Define semi-latus rectum
p=af*(1-eccf^2);

% Express R and V in the PQW system from given COE
Rpqw=(p/(1+eccf*cos(nuf)))*[cos(nuf); sin(nuf); 0];

Vpqw=(sqrt(MU/p))*[-sin(nuf); (eccf+cos(nuf)); 0];