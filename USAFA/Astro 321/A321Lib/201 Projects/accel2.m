function a = accel2(r)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This specific function computes the acceleration of an object in 
% orbit around the earth
%
% Inputs
%  u = position vector (x,y) in km
%
% Outputs
%  y = acceleration vector (x,y) in km/s^2
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MU = 398600.5;
a = (-MU/mag(r)^3)*r;
