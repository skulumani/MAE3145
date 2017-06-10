function a = RVaccel(Posint)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This specific function computes the acceleration of an object in orbit
%
% Inputs
%   Posint - initial position vector km
%
% Outputs
%   a - orbial acceleration
%   
% Coupling
%   mag.m - finds magnitude of input vector
%
% References
%   Astro 201 RVPropogation project
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WGS84Data
global MU

% Set the acceleration
a =(-MU/((mag(Posint))^3))*Posint;

