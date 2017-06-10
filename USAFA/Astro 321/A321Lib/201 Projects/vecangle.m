function x = vecangle(a,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: x = vecangle(a,b)
%
% The function "vecangle" computes the small angle between two vectors
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   a - a vector (any units)
%   b - a vector (any units)
% Outputs:
%   x - angle between vectors a and b (rad)
%
% Globals: None
%
% Constants: None
%
% Coupling: 
%   mag
% 
% References:
%   Understanding Space, Sellers, Appen A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compute the angle

x = acos(dot(a,b)/(mag(a)*mag(b)));
