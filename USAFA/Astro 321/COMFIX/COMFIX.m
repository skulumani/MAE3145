%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: COMFIX
% 
% This program converts radar observations from an input file into COES.
%
% Author:   C2C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    file containing radar observations and site data
%
% Outputs:
%    file containing COEs
% 
% Globals: 
%    WGS84Data
% 
% Constants: None
% 
% Coupling: 
%    comfix_input,GSTLST,site,rvtopos,axisrot,ElOrb,comfix_output
%
% References:
%    Astro 321 COMFIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Open Constants
WGS84Data;

% Declare Global variable
global OmegaEarth;

% Open input and output files
fidi=fopen('comfix.dat','rt');
fido=fopen('comfixACTUAL.txt','wt');

% Create a loop to continually continue calculations while not at the end
% of the input file
counter=1;
while ~feof(fidi)
    % Read in data from file
    [sitlat,sitlon,sitalt,rho,az,el,drho,daz,del,jd] = comfix_input(fidi, fido);
    
    % Calculate GST and LST
    [gst,lst]=GSTLST(jd,sitlon);
    
    % Calculate site vector
    R_site=site(sitlat,lst,sitalt);
    
    % Calculate the range vector 
    [Rho_sez,Drho_sez]=rvtopos(rho,az,el,drho,daz,del);
    
    % Perform rotations to convert range/range rate vector from SEZ to IJK
    Rho_ijk=axisrot(Rho_sez,2,-(pi/2-sitlat));
    Rho_ijk=axisrot(Rho_ijk,3,-lst);
    
    Drho_ijk=axisrot(Drho_sez,2,-(pi/2-sitlat));
    Drho_ijk=axisrot(Drho_ijk,3,-lst);
    
    % Calculate position and velocity vectors
    R_ijk=Rho_ijk+R_site;
    V_ijk=Drho_ijk+cross([0;0;OmegaEarth],R_ijk);
    
    % Calculate the COEs
    [p,a,ecc,incl,raan,argp,nu,m,u,l,CapPi] = ElOrb ( R_ijk,V_ijk );
    
    % Output data to output file
    comfix_output(fido, Rho_sez, Drho_sez, R_site, Rho_ijk,Drho_ijk, R_ijk, V_ijk, gst, lst, a, ecc, incl, raan, argp, nu);
    
    % Increment counter for next set of data
    counter=counter +1;
end

% Close input and output files
fclose(fidi);
fclose(fido);
    
        