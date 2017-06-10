function y = accel(u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This specific function computes the acceleration of an object in a 
% two dimensional problem.
%
% Inputs
%  u = position vector (x,y) in km
%
% Outputs
%  y = acceleration vector (x,y) in km/s^2
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% compute the distance from the center of Earth
r = 6378.137 + u(2);

% Set the horizontal acceleration equal to zero
xaccel = 0;

% Use two body motion to compute the vertical acceleration
yaccel = -3.986e5/r^2;

% Create output acceleration vector
y = [xaccel;yaccel];
