function [magnitude] = mag(V)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: magnitude = mag(V)
% 
% This program wil determine the magnitude of any input vector in column form.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    V - any dimension vector in column form 
%
% Outputs:
%    magnitude - the magnitude of said input vector
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 Lesson 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define a holding variable for the inside of the square root function

sqrcomp=0;

% Loop that adds the square of the components of the input vector

for n = 1:length(V)
    sqrcomp = V(n)^2 + sqrcomp;
end

% Outputs the final magnitude

magnitude = sqrt(sqrcomp);