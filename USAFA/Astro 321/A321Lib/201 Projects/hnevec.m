function [H,N,E]=hnevec(R,V)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [H,N,E]=hnevec(R,V)
%
% The function hnevec computes the h, n and e vectors
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   R - position vector (km)
%   V - velocity vector (km/s)%     
%
% Outputs:
%   H - the specific angular momentum vector
%   N - the ascending node vector
%   E - the eccentricity vector
%
% Globals: MU
%
% Constants: None
%
% Coupling: None
% 
% References:
%   "Understanding Space", Sellers Chapter 5
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global MU

% Compute the specific angular momentum

H=cross(R,V);

% Compute the ascending node vector

K=[0;0;1];
N=cross(K,H);

%Compute the eccentricity vector
r=mag(R);
v=mag(V);
E = (1/MU)*( (v^2-(MU/r))*R - (dot(R,V)*V));
