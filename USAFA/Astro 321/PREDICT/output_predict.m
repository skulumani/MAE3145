function output_predict(vis,rho,az,el,jd,outfile)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% OUTPUT_PREDICT:  Outputs observation information about satellites under 
%           certain visibility criterion
%
% output_predict(vis,sitedark,rho,az,el,jd,outfile)
%
% Author: 	Dr Paul Vergez, USAFA, Fall 03
%
% Inputs:
%   rho       - Range                                           (km)
%   az		  - azimuth                                        (rad)
%   el		  - Elevation                                      (rad)
%   sitedark  - Flag for observer in darkness
%   vis       - Flag for visibility of satellite
%   jd		  - Julian Date                                   (days)
%   outfile   - Output file designator
%
% Locals:
%    year     - Year for start/stop times
%    month    - month at epoch time (integer) 
%    day      - Day of the month at epoch time (integer) 
%    hour     - Hour of the day at epoch time (integer)
%    min      - Minute of the hour at epoch time (integer)
%    sec      - Second of the minute at epoch time (decimal)
%
% Globals: 
%    Deg      - Converts radians to degrees
%
% Couplings: 
%    InvJulianDay - Finds the month, day, hour, min, sec given Julian Date
%
% References:
%    none
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global Deg

    [year,mon,day,hr,min,sec]=InvJulianDay(jd);	% Find time parameters
    
    % Adjust time parameters for round-off errors.  Time should be in 2-minute increments
    
    if sec > 30
        min = min + 1;
    end
    
    % Output visibility flag
    fprintf(outfile,'%6d',mon);fprintf(outfile,'/');fprintf(outfile,'%2d',day);
    fprintf(outfile,'%6d',hr);fprintf(outfile,':');fprintf(outfile,'%2d',min);
    fprintf(outfile,'%16.3f',rho);
    fprintf(outfile,'%12.3f',az*Deg);
    fprintf(outfile,'%10.3f',el*Deg);
    if vis==1.0,
       fprintf (outfile,'    Yes\n');
   else
       fprintf (outfile,'     No\n');
   end
    %fprintf(outfile,'%17.8f\n',jd);