function [B]=axisrot(A,axis,alpha)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [B]=axisrot(A,axis,alpha)
% 
% This program performs one of three coordinate transformations to convert
% a vector from the PQW system to the IJK system.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    A - input vector in PQW system
%    axis - scalar determining around which axis to rotate
%    alpha - scalar angle determining the magnitude of rotation rad
%
% Outputs:
%    B - output vector in IJK system   
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 Lesson 22 COE2RV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine which axis to rotate and perfrom associated rotation
if axis==1 
    B=[1 0 0; 0 (cos(alpha)) (sin(alpha)); 0 (-sin(alpha)) (cos(alpha))]*A;
elseif axis==2 
    B=[(cos(alpha)) 0 (-sin(alpha)); 0 1 0; (sin(alpha)) 0 (cos(alpha))]*A;
elseif axis==3
    B=[(cos(alpha)) (sin(alpha)) 0; (-sin(alpha)) (cos(alpha)) 0; 0 0 1]*A;
end