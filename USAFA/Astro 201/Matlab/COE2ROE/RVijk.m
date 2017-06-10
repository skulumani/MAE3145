function [Rijk,Vijk]=RVijk(Rpqw,Vpqw,inclf,raanf,argpf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [Rijk,Vijk]=RVijk(Rpqw,Vpqw,inclf,raanf,argpf)
% 
% This function converts the given R and V vectors in the PQW system into
% the corresponding vectors in the IJK system.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    Rpqw - position vector in PQW system km
%    Vpqw - velocity vector in PQW system km/sec
%    inclf - inclination at final TOF rad
%    raanf - Right Ascension of the Ascending Node at final TOF rad
%    argpf - argument of perigee at final TOF rad
%
% Outputs:
%    Rijk - position vector in IJK system km
%    Vijk - velocity vector in IJK system km/sec
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: 
%    axisrot - performs the coordinate system rotation to move from PQW to
%    IJK
%
% References:
%    Astro 201 Lesson 22 COE2RV 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perform a 3-1-3 rotation to move from PQW to IJK
Rint=axisrot(Rpqw,3,-argpf);

Rint=axisrot(Rint,1,-inclf);

Rint=axisrot(Rint,3,-raanf);

Rijk=Rint;

Vint=axisrot(Vpqw,3,-argpf);

Vint=axisrot(Vint,1,-inclf);

Vint=axisrot(Vint,3,-raanf);

Vijk=Vint;