function [af eccf inclf raanf argpf nuf]= Update(ai,ecci,incli,raani,argpi,nui,tof)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [af eccf inclf raanf argpf nuf]=
% Update(ai,ecci,incli,raani,argpi,nui,tof)
% 
% This program will determine the future COEs of a satellite given an
% initial set COEs and time of flight.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    ai - initial semi major axis in km
%    ecci - initial eccentricity
%    incli - initial inclination radians
%    raani - initial right ascension of the ascending node radians
%    argpi - initial argument of perigee radians
%    nui - initial true anomaly degrees
%    tof - time of flight seconds
%
% Outputs:
%    af - final semi major axis in km
%    eccf - final eccentricity
%    inclf - final inclination radians
%    raanf - final right ascension of the ascending node radians
%    argpf - final argument of perigee radians
%    nuf - final true anomaly degrees
% 
% Globals: 
%    MU
%
% Constants: 
%    MU
% 
% Coupling: 
%    newton.m
%    revcheck.m
%
% References:
%    Astro 201 COV Propogation Project 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global MU

% Initial eccentric anomaly
Ei = acos((ecci+cos(nui))/(1+ecci*cos(nui)));
% Quadrant check
if nui > pi
    Ei = 2*pi -Ei;
end

% Initial mean anomaly
Mi=Ei-ecci*sin(Ei);

n=sqrt(MU/(ai^3));

% Future mean anomaly
Mf = n*tof+Mi;

% Put Mf into unit circle
Mf = revcheck(Mf,2*pi);

% Iterate to find future eccentric anomaly
Ef=newton(ecci,Mf);

% Future true anomaly
nuf=acos((cos(Ef)-ecci)/(1-ecci*cos(Ef)));

% Quadrant check
if Ef > pi 
    nuf=2*pi-nuf;
end

% Propogate other COE
af=ai;
eccf=ecci;
inclf=incli;
raanf=raani;
argpf=argpi;
