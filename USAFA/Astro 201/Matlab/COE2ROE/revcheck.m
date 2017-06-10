function modangle = revcheck(angle,modby)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: revcheck(angle,modby)
% 
% This program will convert any angle into its equivalent between 0 and 2pi
% radians or 0 and 360 degrees.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    angle - an angle inputed by user in either degrees or radians
%    modby - the maximum range of the converted angle in the same units as
%       angle
%
% Outputs:
%    modangle - the converted angle in the range provide by modby
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 Lesson 9 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

revs = angle/modby;           % muliple of unit circle that angle is greater/less than modby
k=floor(revs);                % round the mulitple to the lowest integer
modangle = angle - modby*k;   % convert the angle into the correct range