function [gst,lst]=GSTLST(jd,sitlon)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [gst,lst]=GSTLST(jd,sitlon)
% 
% This program calculates GST and LST giveen the Julian Day and site
% longitude.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    jd - Julian Day
%    sitlon - site longitude (radians)
%
% Outputs:
%    gst - Greenwich Sidereal Time
%    lst - Local Sidereal Time
% 
% Globals: 
%    SidePerSol
% 
% Constants: None
% 
% Coupling: 
%    InvJulianDay
%
% References:
%    Astro 321 COMFIX 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Declare global variables
global SidePerSol;

% Unpack Julian Day back into Year, Month, Day, Hour, Min, Sec
[Yr,Mon,D,H,M,S]=InvJulianDay(jd);

% GSTo
GST0=GSTim0(Yr);

% Calculate GST
gst = GST0 + SidePerSol * 2*pi*FindDays(Yr,Mon,D,H,M,S);

% Calculate LST
lst = gst +sitlon;

% Perform Rev check
gst=revcheck(gst,2*pi);
lst=revcheck(lst,2*pi);