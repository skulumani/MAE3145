function R_ijk=RVector(n,ecc,inc,raan,argp,nu)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: R_ijk=RVector(n,ecc,inc,raan,argp,nu)
% 
% This program takes the COEs and converts it to the satellite position
% vector.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    n - mean motion (rad/sec)
%    ecc - eccentricity
%    inc - inclination (rad)
%    raan - right ascension of the ascending node (rad)
%    argp - argument of periapsis (rad)
%    nu - true anomaly (rad)
%
% Outputs:
%    R_ijk - satellite position vector (km)
% 
% Globals: 
%    MU - 
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    any references 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global MU

% convert mean motion to semi-major axis
a=(MU/n^2)^(1/3);

% compute the parameter p
p = a*(1-ecc^2);

% compute the position vector
rpqw = p/(1 + ecc*cos(nu))*[cos(nu);sin(nu);0];

% rotate the position vector
rtemp1 = axisrot(rpqw,3,-argp);
rtemp2 = axisrot(rtemp1,1,-inc);
R_ijk   = axisrot(rtemp2,3,-raan);

