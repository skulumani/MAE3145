function COEprint(R,V, a,ecc,incl,raan,argp,nui,nuf,rp,ra,sme,period,tof,Rpqw,Vpqw,Rijk,Vijk,fid,count)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: COEprint(R,V,a,ecc,incl,raan,argp,nu,rp,ra,sme,period,fid,count)
% 
% This m file takes the COE inputs and writes the values to a text file.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    R - position vector km
%    V - velocity vector km/sec
%    a - semimajor axis km
%    ecc - eccentricity
%    incl - inclination radians
%    raan - right ascension of the ascending node raan radians
%    argp - argument of perigee radians
%    nu - true anamoly radians
%    rp - radius of perigee km
%    ra - radius of apogee km
%    sme - specific mechanical energy 
%    period - period hours
%    fid - file id
%    count - case number
%    tof - time of flight seconds
%    Rpqw - position vector in PQW form km
%    Vpqw - velocity vector in PQW form km/sec
%    Rijk - position vector in IJK form km
%    Vijk - velocity vector in IJK form km/sec
%
% Outputs:
%    none
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 COE2RV project 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fid,'%s %1.0f %s\n', '******************  CASE ', count,'  *******************');

% Print the position vector and all labels
fprintf(fid, '%s','R (km)   = ');

fprintf(fid,'%8.4f',R(1));
fprintf(fid,'%s', ' I     ');

fprintf(fid,'%8.4f',R(2));
fprintf(fid,'%s', ' J     ');

fprintf(fid,'%8.4f',R(3));
fprintf(fid,'%s', ' K     ');

fprintf(fid,'%s', 'Mag=  ');
fprintf(fid,'%8.4f\n', mag(R));

%Print the velocity vector and all labels
fprintf(fid, '%s','V (km\s)   = ');

fprintf(fid,'%8.4f',V(1));
fprintf(fid,'%s', ' I     ');

fprintf(fid,'%8.4f',V(2));
fprintf(fid,'%s', ' J     ');

fprintf(fid,'%8.4f',V(3));
fprintf(fid,'%s', ' K     ');

fprintf(fid,'%s', 'Mag=  ');
fprintf(fid,'%8.4f\n', mag(V));

%Print blank line
fprintf(fid,'%s\n','   ');

%Print the Radius of Perigee
fprintf(fid,'%s', 'Radius of Perigee          (km) =   ');
fprintf(fid, '%8.4f\n', rp);

%Print the Radius of Apogee
fprintf(fid,'%s','Radius of Apogee          (km) =   ');
fprintf(fid,'%8.4f\n', ra);

%Print Energy
fprintf(fid,'%s', 'Energy          (km^2/sec^2) =   ');
fprintf(fid,'%8.4f\n' , sme);

%Print Period
fprintf(fid, '%s','Period          (hours) =   ');
fprintf(fid,'%8.4f\n', period/3600);

%Print Semimajor Axis
fprintf(fid,'%s', 'Semimajor Axis         (km) =   ');
fprintf(fid,'%8.4f\n', a);

%Print Eccentricity
fprintf(fid,'%s', 'Eccentricity          =   ');
fprintf(fid,'%8.4f\n', ecc);

%Print blank line
fprintf(fid,'%s\n','   ');

%Print Inclination
fprintf(fid,'%s', 'Inclination          (deg) =   ');
fprintf(fid,'%8.4f\n', incl*(360/(2*pi)));

%Print RAAN
fprintf(fid,'%s', 'Right Ascension of the Ascending Node          (deg) =   ');
fprintf(fid, '%8.4f\n', raan*(360/(2*pi)));

%Print Argument of Perigee
fprintf(fid,'%s', 'Argument of Perigee          (deg) =    ');
fprintf(fid,'%8.4f\n',argp*(360/(2*pi)));

%Print True Anomaly
fprintf(fid,'%s','True Anomaly          (deg) =   ');
fprintf(fid,'%8.4f\n',nui*(360/(2*pi)));

%Print blank line
fprintf(fid,'%s\n','   ');

%Print Time of Flight 
fprintf(fid,'%s','Time of Flight          (minutes) =   ');
fprintf(fid,'%8.4f\n',tof/60);

%Print Future True Anomaly 
fprintf(fid,'%s','Future True Anomaly          (deg) =   ');
fprintf(fid,'%8.4f\n',(nuf*(360/(2*pi))));

%Print blank line
fprintf(fid,'%s\n','   ');

% Print the PQW position vector and all labels
fprintf(fid, '%s','RPQW (km)   = ');

fprintf(fid,'%8.4f',Rpqw(1));
fprintf(fid,'%s', ' P     ');

fprintf(fid,'%8.4f',Rpqw(2));
fprintf(fid,'%s', ' Q     ');

fprintf(fid,'%8.4f',Rpqw(3));
fprintf(fid,'%s', ' W     ');

fprintf(fid,'%s', 'Mag=  ');
fprintf(fid,'%8.4f\n', mag(Rpqw));

%Print the PQW velocity vector and all labels
fprintf(fid, '%s','VPQW (km\s)   = ');

fprintf(fid,'%8.4f',Vpqw(1));
fprintf(fid,'%s', ' P     ');

fprintf(fid,'%8.4f',Vpqw(2));
fprintf(fid,'%s', ' Q     ');

fprintf(fid,'%8.4f',Vpqw(3));
fprintf(fid,'%s', ' Q     ');

fprintf(fid,'%s', 'Mag=  ');
fprintf(fid,'%8.4f\n', mag(Vpqw));

% Print the IJK position vector and all labels
fprintf(fid, '%s','RIJK (km)   = ');

fprintf(fid,'%8.4f',Rijk(1));
fprintf(fid,'%s', ' I     ');

fprintf(fid,'%8.4f',Rijk(2));
fprintf(fid,'%s', ' J     ');

fprintf(fid,'%8.4f',Rijk(3));
fprintf(fid,'%s', ' K     ');

fprintf(fid,'%s', 'Mag=  ');
fprintf(fid,'%8.4f\n', mag(Rijk));

%Print the ijk velocity vector and all labels
fprintf(fid, '%s','VIJK (km\s)   = ');

fprintf(fid,'%8.4f',Vijk(1));
fprintf(fid,'%s', ' I     ');

fprintf(fid,'%8.4f',Vijk(2));
fprintf(fid,'%s', ' J     ');

fprintf(fid,'%8.4f',Vijk(3));
fprintf(fid,'%s', ' K     ');

fprintf(fid,'%s', 'Mag=  ');
fprintf(fid,'%8.4f\n', mag(Vijk));

%Print blank line
fprintf(fid,'%s\n','   ');

