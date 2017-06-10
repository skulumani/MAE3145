function R_site=site(sitlat,lst,sitalt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: R_site=site(sitlat,lst,sitalt)
% 
% Calculate the site vector in the IJK coordinate system.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    sitlat - site latitude (radians)
%    lst - local sidereal time (radians)
%    sitalt - site altitude (meters)
%
% Outputs:
%    R_site - site vector in IJK system
% 
% Globals: 
%    RE, EEsqrd
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 321 COMFIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Delcare global variables
global RE EEsqrd;

x=((RE/sqrt(1-EEsqrd*(sin(sitlat))^2))+sitalt)*cos(sitlat);
z=(((RE*(1-EEsqrd))/(sqrt(1-EEsqrd*(sin(sitlat))^2)))+sitalt)*sin(sitlat);

R_site=[x*cos(lst);x*sin(lst);z];


