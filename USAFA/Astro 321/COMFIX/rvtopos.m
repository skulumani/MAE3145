function [Rho_sez,Drho_sez]=rvtopos(rho,az,el,drho,daz,del)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [Rho_sez,Drho_sez]=rvtopos(rho,az,el,drho,daz,del)
% 
% This program calculates the range vector in the SEZ system.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    rho - range (km)
%    az - azimuth (radians)
%    el - elevation (radians)
%    drho - range rate (km/sec)
%    daz - azimuth rate (radians/sec)
%    del - elevation rate (radians/sec)
%
% Outputs:
%    Rho_sez - range vector SEZ (km)
%    Drho_sez - range velocity vecotr SEZ (km/sec)
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 321 COMFIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate range vector
rho_s=-rho*cos(az)*cos(el);
rho_e = rho*sin(az)*cos(el);
rho_z=rho*sin(el);

Rho_sez=[rho_s;rho_e;rho_z];

% Calculate range rate vector
drho_s=-drho*cos(az)*cos(el)+rho*daz*sin(az)*cos(el)+rho*del*cos(az)*sin(el);
drho_e=drho*sin(az)*cos(el)+rho*daz*cos(az)*cos(el)-rho*del*sin(az)*sin(el);
drho_z=drho*sin(el)+rho*del*cos(el);

Drho_sez=[drho_s;drho_e;drho_z];