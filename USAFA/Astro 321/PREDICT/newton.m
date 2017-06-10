function E=newton(mean,ecc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: E=newton(mean,ecc)
% 
% This function use's Newton's Method to solve Kepler's Problem.  Also
% using the relationship between Eccentric Anamoly and Mean Anamoly the
% iteration process is improved.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    mean - mean anamoly (radians)
%    ecc - eccentricity
%
% Outputs:
%    E - eccentric anamoly (radians)
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 321 Predict LSN 22 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if 0<mean<pi
    En=mean-ecc;
elseif pi<= mean <2*pi
    En=mean+ecc;
end

diff = 1000000;

while abs(diff) > 1e-9
  Enew=En+ (mean-(En-ecc*sin(En))) / (1-ecc*cos(En));
  diff = Enew - En;
  En = Enew;
end

E=En;