function angle = vecangle(V1,V2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: angle = vecangle(V1, V2)
% 
% This program wil determine the smaller of the two angles between two
% vectors.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    V1 - any dimension vector in row form 
%    V2 - vector with the same dimensions as V1
%
% Outputs:
%    angle - the smaller of the two angles between V1 and V2 in radians
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: 
%   mag.m
%
% References:
%    Astro 201 Lesson 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% finds the dot product of V1 and V2

DProd = dot(V1,V2);

% finds the angle

angle = acos(DProd/(mag(V1)*mag(V2)));