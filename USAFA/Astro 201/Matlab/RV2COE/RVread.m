function [R V]=RVread(fid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [R V]=RVread(fid)
% 
% This m file reads the position and velocity vectors from an input file.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    fid - input file id
%
% Outputs:
%    R - position vector km
%    V - velocity vector km/sec
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 RV2COE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R = fscanf(fid,'%f',3);
V = fscanf(fid,'%f',3);