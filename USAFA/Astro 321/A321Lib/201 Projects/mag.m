function x = mag(a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: x = mag(a)
%
% The function "mag" computes the magnitude of a vector
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   a - a vector (any units)
%
% Outputs:
%   x - the magnitude of a (same units as a)
%
% Globals: None
%
% Constants: None
%
% Coupling: None (list only non-standard Matlab functions)
% 
% References:
%   Understanding Space, Sellers, Appen A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compute the magnitude

x = sqrt(a(1)^2 + a(2)^2 + a(3)^2);
