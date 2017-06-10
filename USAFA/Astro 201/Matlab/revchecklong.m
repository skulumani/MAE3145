function modangle = revchecklong(angle, modby)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: revchecklong(angle,modby)
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

if angle >= 0 & angle < modby  % angle is already in the needed range
    modangle = angle;           % no converting needed
elseif angle >= modby           % angle is greater than the needed range
    while angle > modby
        angle = angle - modby;  % subtract the unit circle until within range
    end
else 
    while angle < 0             % angle is negative and below the needed range   
        angle = angle + modby;  % add the unit circle until within the correct range
    end    
end

modangle=angle                  % display the converted angle