function tempinFahrenheit=cels2fahr(tempinCelsius)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Usage:   TempF=cels2fahr(TempC)
%
% This function will convert an input temperature in Celsius to its
% equivalent temperature in Fahrenheit.
% 
% Author: Joel Miller, Maj, USAF
%
% Input Variable:
%   TempC: tempearture in Celsius (degrees Celsius)   
%
% Output Variable:
%   TempF: temperature in Fahrenheit (degrees Fahrenheit)
%
% Globals:  None
%
% Constants: None
%
% Coupling: None
%
% References: Understanding Space, Sellers, p. 704
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Covert from Celsius to Fahrenheit
tempinFahrenheit=9*tempinCelsius/5+32;
