%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Use Tempcalculator
%
% This m-file prompts the user for a temperature in Celsius, then
% calculates it and returns it to a variable called MyTempInF
%
% Author: Joel Miller, Maj, USAF
%
% Input Variables:
%   User Input:
%       tempc: user input variable with the temperature in C (degrees C)
% Output Variables:
%   Stored to workspace:
%       MyTempInF: resultin Fahrenheit temperature (degrees F)
%
% Globals:  None
%
% Constants: None
%
% Coupling: cels2fahr.m
%
% References: Lsn 05 Astro 201
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%get user input from workspace
tempc=input('Please enter the temperature in Celsius: ');

%now use cels2fahr to calculate the result and store in MyTempInF
MyTempInF=cels2fahr(tempc)