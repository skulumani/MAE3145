function [h n evec] = hnevector(R ,V)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [h n evec] = hnevector(R,V)
% 
% This m file calculate the h,n, and e vectors of an orbit given the
% position and velocity vectors
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    R - position vector km
%    V - velocity vector km/sec
%
% Outputs:
%    h - angular momentum vector
%    n - normal vector
%    e - eccentricity vector
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

% Calculate h
k=[0 0 1];
h=cross(R,V);

% Calculate n
n=cross(k,h);

% Calcualte the eccentricity vector
evec = (1/MU)*(((((mag(V))^2)-(MU/(mag(R))))*R)-((dot(R,V))*V));
