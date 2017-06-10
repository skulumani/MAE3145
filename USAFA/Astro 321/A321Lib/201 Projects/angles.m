function [incl,raan,argp,nu]=angles(R,V,H,N,E)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [incl,raan,argp,nu]=angles(R,V,H,N,E)
%
% The function angles computes the four angular values of the 
% COES
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   R - position vector (km)
%   V - velocity vector (km/s)%     
%   H - the specific angular momentum vector
%   N - the ascending node vector
%   E - the eccentricity vector
%
% Outputs:
%   incl - inclination (rad)
%   raan - right ascension of the ascending node (rad)
%   argp - argument of perigee (rad)
%   nu - true anomaly (rad)
%
% Globals: None
%
% Constants: I,K
%
% Coupling: vegangle
% 
% References:
%   "Understanding Space", Sellers Chapter 5
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compute inclination

K=[0;0;1];
incl = vecangle(K,H);

% Compute right ascension of the ascending node

I = [1;0;0];
raan = vecangle(I,N);
if N(2)<0    %quadrant check
    raan = 2*pi - raan;
end
% Compute argument of perigee

argp = vecangle(N,E);
if E(3)<0    %quadrant check
    argp = 2*pi - argp;
end
% Compute right ascension of the ascending node

nu = vecangle(E,R);
if dot(R,V)<0    %quadrant check
    nu = 2*pi - nu;
end

