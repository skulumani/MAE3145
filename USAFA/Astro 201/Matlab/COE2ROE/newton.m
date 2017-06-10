function [Ef]=newton(ecc,Mf)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: Ef=newton(ecc,Mf)
% 
% This program calculates the future eccentric anaomaly using Newton's
% method and a given eccentricity and future mean anomaly.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    ecc - eccentricity
%    Mf - future mean anomaly
%
% Outputs:
%    Ef - future eccentric anomaly
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 Lesson 16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Eprev=Mf;

diff=100000;

while abs(diff)>1e-8
    
    Enext = Eprev + (Mf -(Eprev-ecc*sin(Eprev)))/(1-ecc*cos(Eprev));
    diff=Enext-Eprev;
    Eprev=Enext;
end

Ef=Eprev;
