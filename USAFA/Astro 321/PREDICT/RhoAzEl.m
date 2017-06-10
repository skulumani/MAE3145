function [rho,az,el]=RhoAzEl(R_ijk,R_site,sitlat,lst)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [rho,az,el]=RhoAzEl(R_ijk,R_site,sitlat,lst)
% 
% This function calculates the topcentric range,azimuth and elevation from
% the site vector and satellite position vector.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    R_ijk - satellite ECI position vector (km)
%    R_site - site ECI position vector (km)
%    sitlat - site geodetic latitude (radians)
%    lst - site local sidereal time (radians)
%
% Outputs:
%    rho - range (km)
%    az - asimuth (radians)
%    el - elevation (radians)
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: 
%    axisrot.m
%    mag.m
%
% References:
%    Astro 321 Predict LSN 22 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find vector from site to satellite
R_sat = R_ijk-R_site;

% Convert satellite vector from IJK to SEZ
R_sat=axisrot(R_sat,3,lst);
R_sat=axisrot(R_sat,2,(pi/2-sitlat));

% Find range, azimuth, and elevation using geometry
rho=mag(R_sat);
el=asin(R_sat(3)/rho);
az=revcheck(atan2(R_sat(2),-R_sat(1)),2*pi);

