function [Ef]=newton(ecc,Mf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [Ef]=newton(ecc,Mf)
%
% The function uses Newton's iteration to solve Kepler's 
% problem
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   ecc - eccentricity
%   Mf - mean anomaly future (rad)%   
%
% Outputs:
%   Ef - eccentric anomaly future
%
% Globals: None
%
% Constants: None
%
% Coupling: None
% 
% References:
%   Iterative Solutions Notes from Astro 201
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get the first guess and set diff to execute the loop at least once

En = Mf;
diff = 999;

% Loop until close enough

while abs(diff) > 1e-8
  Enew=En+ (Mf-(En-ecc*sin(En))) / (1-ecc*cos(En));
  diff = Enew - En;
  En = Enew;
end

Ef = En;