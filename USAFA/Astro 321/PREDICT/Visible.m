function [rho, az, el, vis]=Visible(R_ijk,R_site,sitlat,lst,jd)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [rho, az, el, vis]=Visible(R_ijk,R_site,sitlat,lst,jd)
% 
% This procedure determines if the observer is in the dark.  If so, it then
% computes the topcentric range, azimuth and elevation.  If the elevation
% is greater than 10 deg and the range is less than 1500 km the this
% procedure checks for satellite illumination.  If the satellite is
% illuminated then the satellite is visible.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    R_ijk - satellite ECI position vector (km)
%    R_site - site ECI position vector (km)
%    sitlat - site geodetic latitude (rad)
%    lst - site local sidereal time (rad)
%    jd - Julian date at viewing time 
%
% Outputs:
%    rho -  range (km)
%    az - azimuth (rad)
%    el - elevation (rad)
%    vis -  flag for visiblity (0 or 1)
% 
% Globals: 
%    RE
% 
% Constants: None
% 
% Coupling: 
%    RhoAzEl.m
%
% References:
%    Astro 321 PREDICT LSN 25 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global RE

rho=0;
az=0;
el=0;
vis=0;
    
% Test if site is in darkness
[RSun, RtAsc, Decl] = Sun ( jd);
alpha = vecangle(R_site,RSun);

if alpha > (pi/2)
    % Test if satellite is visible from site
    [rho,az,el]=RhoAzEl(R_ijk,R_site,sitlat,lst);
    
    if (rho<1500) && (el > (10*pi/180))
        % Test if satellite is in the sun 
        beta=vecangle(R_ijk,RSun);
        
        if   beta < (pi/2) || (mag(R_ijk)*sin(beta))>RE
            % If object passes all tests then ouput
            vis=1;
        end
    end
end

