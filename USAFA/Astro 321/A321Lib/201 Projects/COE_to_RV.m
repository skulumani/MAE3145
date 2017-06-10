%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% COE to RV calcualtes the future R and V of a satellite given
% a position, velocity and a time of flight from a file
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   file containing sets of R,V and TOF
% Outputs:
%   file containing the calcualted COE's & future true anomaly
%       & future R & V
%
% Globals: WGS84Data
%
% Constants: None
%
% Coupling: ElOrb,calcextra, Update, newton, RVpqw, RVijk
% 
% References:
%   "Understanding Space", Sellers Chap. 5
%   Iterations Lesson of Astro 201
%   COE's to RV Lesson of Astro 201
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set up constants
WGS84Data;

% open the files that will be needed
fidi=fopen('RV3.dat','rt');
fido=fopen('test2.dat','wt');

% set up thd counter and loop until all the data is done
counter = 1;
while ~feof(fidi)
  % read R and V and tof
  R=fscanf(fidi,'%f',3);
  V=fscanf(fidi,'%f',3);
  tof=fscanf(fidi,'%f',1)*60; %converted to seconds
  
  % compute the COE's
  [a,ecc,incl,raan,argp,nu]=ElOrb(R,V);
  
  % compute other requested data
  [rp,ra,sme,period]=calcextra(a,ecc);
  
  % compute the future true anomaly
  [af,eccf,inclf,raanf,argpf,nuf]=Update(a,ecc,incl,raan,argp,nu,tof);
  
  % compute R and V in pqw frame
  [rpqw,vpqw]=RVpqw(af,eccf,nuf);
  
  % rotate into the ijk frame
  [rijk,vijk]=RVijk(rpqw,vpqw,inclf,raanf,argpf);
  
  % print the results to a file
  fprintf(fido,'***************** Case %4d *****************\n\n',counter);
  fprintf(fido,'R (km)    =%11.4f I  %11.4f J  %11.4f K    Mag= %11.4f\n',R,mag(R));
  fprintf(fido,'V (km/s)  =%11.4f I  %11.4f J  %11.4f K    Mag= %11.4f\n\n',V,mag(V));
  fprintf(fido,'Radius of Perigee (km) = %11.4f\n',rp);
  fprintf(fido,'Radius of Apogee  (km) = %11.4f\n',ra);
  fprintf(fido,'Energy    (km^2/sec^2) = %11.4f\n',sme);
  fprintf(fido,'Period         (hours) = %11.4f\n',period/3600);
  fprintf(fido,'Semimajor Axis    (km) = %11.4f\n',a);
  fprintf(fido,'Eccentricity           = %11.4f\n\n',ecc);
  fprintf(fido,'Inclination                           (deg) = %11.4f\n',incl*180/pi);
  fprintf(fido,'Right Ascension of the Ascending Node (deg) = %11.4f\n',raan*180/pi);
  fprintf(fido,'Argument of Perigee                   (deg) = %11.4f\n',argp*180/pi);
  fprintf(fido,'True Anamaly                          (deg) = %11.4f\n\n',nu*180/pi);
  fprintf(fido,'Time of Flight  (Minutes) = %11.4f\n',tof/60);
  fprintf(fido,'Future True Anamaly (deg) = %11.4f\n\n',nuf*180/pi);
  fprintf(fido,'RPQW (km)  = %11.4f P %11.4f Q %11.4f W  Mag = %11.4f\n',...
      rpqw,mag(rpqw));
  fprintf(fido,'VPQW (km/s)= %11.4f P %11.4f Q %11.4f W  Mag = %11.4f\n',...
      vpqw,mag(vpqw));
  fprintf(fido,'RIJK (km)  = %11.4f I %11.4f J %11.4f K  Mag = %11.4f\n',...
      rijk,mag(rijk));
  fprintf(fido,'VIJK (km)  = %11.4f I %11.4f J %11.4f K  Mag = %11.4f\n',...
      vijk,mag(vijk));

  %increment the counter for the next set of data
  counter = counter + 1;
end

% close the files 
fclose(fidi);
fclose(fido);
