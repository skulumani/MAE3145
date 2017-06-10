%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: Predict.m
% 
% This program takes TLE data and computes the topocentric range, azimuth, and
% elevation at two minute intergals given user inputed observation site and
% observation window.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    TLE data file
%
% Outputs:
%    Viewsat text file
% 
% Globals: None
% 
% Constants: 
%    WGS84Data
%
% Coupling: 
%    userinput.m
%    input_predict.m
%    Update.m
%    GSTLST.m
%    site.m
%    RVector.m
%    Visible.m
%    output_predict.m
%
% References:
%    Astro 321 PREDICT 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initial matlab formatting
format long;
format compact;

% Open Constants 
WGS84Data;

% Open input and output files
fidi=fopen('TLE.txt','rt');
fido=fopen('ViewSat.txt','wt');

% Input user observation information
[startjd,stopjd,sitlat,sitlon,sitalt] = userinput(fido);

% Calculate time step in Julian Date
tstep = 2/(24*60);

% Create a loop to continually continue calculations while not at the end
% of the input file

while ~feof(fidi)
    
    % Input TLE data
    [epoch_jd,ndot2,inc0,raan0,ecc0,argp0,mean0,n0,raandot,argpdot,eccdot]=input_predict(fidi,fido);
    
    % Initialize counter variables to track time during time loop
    counter=1;
    current=startjd;
    
    % Create loop to continually calculate viewing window while within
    % viewing window
    
   while current<stopjd
        % Elapsed time in seconds from TLE epoch to current observation time
        deltat=(current-epoch_jd)*(24*60*60);
        
        % Calculate satellite data at current observation time
        [n,ecc,raan,argp,nu]=Update(deltat,n0,ndot2,ecc0,eccdot,raan0,raandot,argp0,argpdot,mean0);
        
        % Calculate current satellite and site position
        [gst,lst]=GSTLST(current,sitlon);
        R_site=site(sitlat,lst,sitalt);
        R_ijk=RVector(n,ecc,inc0,raan,argp,nu);
        
        % Test to see if satellite is visible
        [rho, az, el, vis]=Visible(R_ijk,R_site,sitlat,lst,current);
        
        % Output satellite observation data if visible
        if vis==1.0
            output_predict(vis,rho,az,el,current,fido);
        end
        
        % Advance current observation time by time step
        current=startjd+(tstep*counter);
        counter=counter+1;
    end
end

% Close input and output files
fclose(fidi);
fclose(fido);