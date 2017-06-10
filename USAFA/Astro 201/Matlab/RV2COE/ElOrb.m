function [a, ecc, incl, raan, argp, nu]=ElOrb(R, V)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [a, ecc, incl, raan, argp, nu]=ElOrb(R,V)
% 
% This program calculates the orbital elements from a given position and
% velocity vectors.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    R - position vector
%    V - velocity vector
%
% Outputs:
%    a - semimajor axis km
%    ecc - eccentricity
%    incl - inclination radians
%    raan - right ascension of the ascending node radians
%    argp - argument of perigee radians
%    nu - true anamoly radians
% 
% Globals: 
%    MU - combination of the radius of the earth and the universal
%    gravitational constant
% 
% Constants: None
% 
% Coupling: 
%    hnevector.m
%
% References:
%    Astro 201 RV2COE project
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global MU

% Call hnevector to find the h, n, and e vectors
[h n evec] = hnevector(R,V);

% Calculate the semimajor axis
a=(-MU)/(2*((((mag(V))^2)/2)-(MU/(mag(R)))));

% Calculate the eccentricity
ecc = mag(evec);

% Calculate the inclination
k =[0 0 1];
incl=vecangle(k,h);

i=[1 0 0];

% Calculate the Right Ascension of the Ascending Node and perform a
% quadrant check
if n(2)<0
    raan = (2*pi)-vecangle(i,n);
else
    raan=vecangle(i,n);
end

% Calculate the argument of perigee and perform a quandrant check
if evec(3)<0
    argp = (2*pi)-vecangle(n,evec);
else
    argp = vecangle(n,evec);
end

% Calculate the true anamoly and perform a quadrant check
if dot(R,V)<0
    nu = (2*pi)-vecangle(evec,R);
else
    nu = vecangle(evec,R);
end