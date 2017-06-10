function vel=kinemat(alt,g)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: vel = kinemat(alt,g)
%
% The function "kinemat" determines the velocity of a falling object
% based upon the input altitude and acceleration due to gravity.
%
% Author: C3C Shankar Kulumani         USAFA/CS-19        719-333-4741
%
% Inputs:
%   alt - a scalar altitude above some reference point (meters)
%   g -   a scalar acceleration due to gravity (meters per second squared)
%
% Outputs:
%   vel - the impact velocity of the falling object (meters per second)
%
% Global: None
% 
% Constants: None
%
% Coupling: None
%
% References:
%   Astro 210 Lesson 2 slides
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vel=sqrt(2*g*alt);

