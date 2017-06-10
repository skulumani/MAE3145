function [name,satnum,class,lyr,lnum,lpiece,epyr,epdoy,deriv,deriv2,...
          bstar,ephtype,elnum,...
          inc,raan,ecc,aop,ma,rpd,revnum] = get_tle(fileid,satreq)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use:  [name,satnum,class,lyr,lnum,lpiece,epyr,epdoy,deriv,deriv2,...
%         bstar,ephtype,elnum,...
%         inc,raan,ecc,aop,ma,rpd,revnum] = gettle(fileid,satreq)
%
% The function gettle reads in a two line element set.  The tle file must 
% be opened first before the first call to this function.
% This function then searches for the next tle in the
% file for the requested satellite number (satreq).  If satreq is set to 
% zero, the next tle in the set is read.  gettle returns a satnum equal to 
% zero if the requested satellite is not found in the file.
%
% Author: Scott Dahlke USAFA/DFAS  
%     
% modifications
%   09/19/95  srd  written
%   04/02/97  srd  changed to handle linefeed characters
%   06/02/06  srd  modified to work in Matlab and improved robustness
%   07/06/06  srd  fixed problem with example lines in input files
%
% Inputs:
%   fileid - a file id of the opened tle file to search
%   satreq - the satellite number to search for (enter 0 to find next tle)
%
% Outputs:
%   name - satellite name  
%   satnum - satellite number found (0 if the requested sat was not found)
%   class  - classification (classified, unclassified)
%   lyr    - launch year (last 2 digits)
%   lnum   - launch number of the year
%   lpiece - piece of launch (a string 3 characters long)
%   epyr   - epoch year (last 2 digits)
%   epdoy  - epoch day of year
%   deriv  - first time derive of mean mot. divided by 2 (rev/day^2)
%   deriv2 - 2nd deriv of mean mot div by 6 (rev/day^3)
%   bstar  - bstar drag term
%   ephtype- ephemeris type
%   elnum  - element number (modulo 1000)
% 
%   inc    - inclination (deg)
%   raan   - right ascension of asc. node (deg)
%   ecc    - eccentricity
%   aop    - argument of perigee (deg)
%   ma     - mean anomaly (deg)
%   rpd    - mean motion (revs per day)
%   revnum - revolution number(modulo 100,000)
%
% Globals: None
%
% Constants: None
%
% Coupling: None 
% 
% References:
%  "Fundamental of Astrodynamics and Applictions, 2nd Ed", by Vallado
%  www.celestrak.com/NORAD/documentation/tle-fmt.asp
%  manpages.debian.net/cgi-bin/...
%   display_man.cgi?id=e2095ebad4eb81b943fcdd55ec9b7521&format=html
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---- initialize all of the outputs to zero or null

  name = '';
  satnum = 0;
  class = ' ';
  lyr = 0;
  lnum = 0;
  lpiece = 0;
  epyr = 0;
  epdoy = 0;
  deriv = 0;
  deriv2 = 0;
  bstar = 0;
  ephtype = 0;
  elnum = 0;
  
  inc = 0;
  raan = 0;
  ecc = 0;
  aop = 0;
  ma = 0;
  rpd = 0;
  revnum = 0;

  
%---- initialize line 0 and 1 and read in the first line of the file
%---- we store 3 lines of data because each TLE may be that long
  line0 = '';
  line1 = '';
  
  %return if end of file
  if (feof(fileid)) 
    return;
  end 
  
  line2 = fgetl(fileid);
  
  %remove extra spaces from the end of the line
  len = length(line2);
  if len > 69
    while line2(len) == ' ' & len > 69
      len = len - 1;
      line2 = line2(1:(len));
    end;
  end;

%------------------------------------------------------------------
%---- top of the loop for getting new lines from the file

  while (~feof(fileid))

%---- set satnum = zero in case we don't find the right satellite

  satnum = 0;

%---- get next line after shifting the other two

  line0 = line1;
  line1 = line2;
  
  %return if end of file
  if (feof(fileid))  
    return;
  end 
  
  line2 = fgetl(fileid);
  
  %remove extra spaces from the end of the line
  len = length(line2);
  if len > 69
    while line2(len) == ' ' & len > 69
      len = len - 1;
      line2 = line2(1:(len));
    end;
  end;

%---- if the following criteria is met we
%     probably have a valid set of elements
  valid = 0;
  if length(line1)==69    & length(line2)==69  
    if line1(1:2)=='1 '   & line2(1:2)=='2 ' 
      chksum1 = sscanf(line1(69),'%f');
      chksum2 = sscanf(line2(69),'%f');
      if isnumeric(chksum1) & isnumeric(chksum2)
        valid = 1;
      end
    end
  end

%---- extract data if we think it is a valid set

  if valid == 1 
    
    %Line 0 - extract the satellite name 
    %this also returns a blank name if it really is a two line element
    %set without any 'name' lines
    if isempty(line0)
        name = '';  
    elseif line0(1:2) == '2 '
       name = '';  
    else
       name = line0;
    end
    
    %Line 1 - extract data from first line
    satnum = sscanf(line1(3:7),  '%f');  %satellite number
    class  = sscanf(line1(8:8),  '%c');  %classification
    lyr    = sscanf(line1(10:11),'%f');  %launch year
    lnum   = sscanf(line1(12:14),'%f');  %launch number
    lpiece = sscanf(line1(15:17),'%s');  %piece of launch
    epyr   = sscanf(line1(19:20),'%f');  %epoch year (last 2 digits)
    epdoy  = sscanf(line1(21:32),'%f');  %epoch day of year
    deriv  = sscanf(line1(34:43),'%f');  %first time derive of mean mot.
                                         %divided by 2
    man    = sscanf(line1(45:50),'%f');  %mantissa
    expon  = sscanf(line1(51:52),'%f');  %exponent
    deriv2 = man*1e-5*10^expon;          %2nd deriv of mean mot div by 6
    man    = sscanf(line1(54:59),'%f');  %mantissa
    expon  = sscanf(line1(60:61),'%f');  %exponent
    bstar  = man*1e-5*10^expon;          %bstar term
    ephtype= sscanf(line1(63:63),'%f');  %ephemeris type
    elnum  = sscanf(line1(65:68),'%f');  %element number (modulo 1000)

    %Line 2 - extract data from second line
    
    %satellite number has already been scanned
    inc    = sscanf(line2(9:16), '%f');  %inclination
    raan   = sscanf(line2(18:25),'%f');  %right ascension of asc. node
    ecc    = sscanf(line2(27:33),'%f')*1e-7;  %eccentricity
    aop    = sscanf(line2(35:42),'%f');  %argument of perigee
    ma     = sscanf(line2(44:51),'%f');  %mean anomaly
    rpd    = sscanf(line2(53:63),'%f');  %mean motion (revs per day)
    revnum = sscanf(line2(64:68),'%f');  %revolution number(modulo 100,000)

  end
  
%---- process if no error

  if (valid == 1)

    %was request to just get next satellite? if so return this data
    if (satreq == 0) 
      return;
    end

    %is this the sat requested?
    if (satreq == satnum) 
      return;
    end

  end

%---- we either had an error or this was not the correct satellite
%     so reset the satellite number and get next line

  satnum = 0;

  end %loop
end


