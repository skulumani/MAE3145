function newang = revcheck(ang,modby)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: newang = revcheck(ang,modby)
%
% The function revcheck reduces or increases an angle to the 
% equivalent angle between 0 and modby, where modby is 2pi or 360 deg
% depending on the units used
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   ang - an input angle in radians or degrees
%   modby - 2pi or 360 to match units of ang
% Outputs:
%   newang - the equivalent angle between 0 and modby
%
% Globals: None
%
% Constants: None
%
% Coupling: None
% 
% References:
%   Structures Loops lesson of Astro 201
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% use a quick method of adjusting the angle
revs = ang/modby;
k = floor(revs);
newang = ang - modby*k;
