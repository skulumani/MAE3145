function [startjd,stopjd,sitlat,sitlon,sitalt] = userinput(outfile)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%                       Program userinput
%%
%% Author       : Dr Paul Vergez, USAFA, Fall 03
%%
%% [startjd,stopjd,sitlat,sitlon,sitalt] = userinput(outfile)
%%
%% Input        :
%%    outfile      - flag for output file
%%
%% Output        :
%%    startjd    - Julian Date to start looking for viewing ops (days)
%%    stopjd     - Julian Date to start looking for viewing ops (days)
%%    sitlat     - Latitude of viewing site                      (rad)
%%    sitlon     - Longitude of viewing site                     (rad)
%%    sitalt     - Altitude of viewing site                       (km)
%%
%% Locals:
%%    start      - Day of year to start looking for viewing ops (days)
%%    stop       - Day of year to stop looking for viewing ops  (days)
%%    year       - Year for start/stop times
%%    mon        - Month for start/stop times (integer)
%%    day        - Day of the month day for start/stop times (integer)
%%    hour       - Hour of the day for start/stop times (integer)
%%    min        - Minute of the hour for start/stop times (integer)
%%    sec        - Second of the minut for start/stop times (decimal)
%%
%% Globals:
%%    Rad        - Conversion from degrees to radians 
%%
%% Coupling:
%%    DayOfYr2MDHMS	Finds Month, Day, Hour, Min, Seconds for a given
%%    			    day of year and year (integer or decimal) 
%%    JulianDay    - Finds Julian Day given DayOfYr2MDHMS info
%%       
%% References   : None.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global Rad

fprintf(outfile,' PREDICT Results By: << C2C Shankar Kulumani >>  \n\n');

disp('Enter your location --');
sitlat =input('Site latitude (deg)?')
sitlon =input('Site longitude (deg)?')
sitalt = input('Site altitude (km)?')

year = input('Year to start observations?')
start =input('Day of year to start observations?')
stop = input('Day of year to stop observations?')

fprintf(outfile,' Echo Check Input Data:\n\n');
fprintf(outfile,'      Site Latitude  = ');fprintf(outfile, '%10.3f deg\n',sitlat);
fprintf(outfile,'      Site Longitude = ');fprintf(outfile, '%10.3f deg\n',sitlon);
fprintf(outfile,'      Site Altitude  = ');fprintf(outfile, '%10.3f km\n\n',sitalt);

fprintf(outfile,'      Year           = ');fprintf(outfile, '%10.0f\n',year);
fprintf(outfile,'      Start Day      = ');fprintf(outfile, '%10.1f\n',start);
fprintf(outfile,'      End Day        = ');fprintf(outfile, '%10.1f\n\n',stop);

% Convert to working units:

sitlat=sitlat*pi/180;
sitlon=sitlon*pi/180;

% Calculate the start Julian date

[SMon,SD,SH,SM,SSec]=DayOfYr2MDHMS(year,start);
startjd=JulianDay(year,SMon,SD,SH,SM,SSec);

% Calculate the stop Julian date

[EMon,ED,EH,EM,ESec]=DayOfYr2MDHMS(year,stop);
stopjd=JulianDay(year,EMon,ED,EH,EM,ESec);

fprintf(outfile,' Echo Check Working Units\n\n');

fprintf(outfile,'     Site Latitude  = ');fprintf(outfile, '%11.8f rad\n',sitlat);
fprintf(outfile,'     Site Longitude = ');fprintf(outfile, '%11.8f rad\n\n',sitlon);

fprintf(outfile,'     Start Julian Day = ');fprintf(outfile, '%13.5f\n',startjd);
fprintf(outfile,'     End Julian Day   = ');fprintf(outfile, '%13.5f\n\n',stopjd);