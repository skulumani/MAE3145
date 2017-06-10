funtion tempinf = cels2fahr(tempinc)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: tempinf= cels2fahr(tempinc)
% 
% The function cels2fahr converts the temperature in celsius of the input
% value, tempinc, into fahrenheit, tempinf.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    tempinc - a scalar value for temperature in degrees celsius
%
% Outputs:
%    tempinf - a scalar value for temperature in degrees fahrenheit
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 210 lesson 4 powerpoint
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Convert Celsius into Fahrenheit
% Ouput the value into tempinf

tempinf = 9*tempinc/5 + 32;