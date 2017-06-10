%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: RV2COE
% 
% This script file reads R and V vectors from a text file and outputs the
% corresponding COEs.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    text file - with R and V vectors
%
% Outputs:
%    text file - COE.txt
% 
% Globals: 
%   None
% Constants: 
%    WGS84Data
%    MU
% Coupling: 
%    ElOrb.m - finds the COE
%    OrbParams.m - finds Radius of Perigee, Radius of Apogee, Specific
%       Mechanical Energy, and Period
%    RVRead.m - reads the R and V vectors from and input text file
%    COEPrint.m - prints the COE along with the extra information into a
%       text file called COE.txt
%
% References:
%    Astro 201 Project RV to COEs 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Open constants and equations script file
WGS84Data

%Open text files for reading and writing
fidin = fopen('RV1.txt','rt');
fidout = fopen('COE.txt','wt');

%Initialize count - keeps track of mulitple R and V vectors
count =1;

%Continue to run while not at end of file
while not(feof(fidin))
    %Read in R and V vector from input file
    [R V ] =RVread(fidin);
    
    %Call ElOrb to calulate COE
    [a, ecc, incl, raan, argp, nu] = ElOrb(R,V);
    
    %Call OrbParams to calculate non COE values
    [rp,ra,sme,period] =OrbParams(a,ecc);
    
    %Call COEprint to print all values to output file
    COEprint(R,V,a, ecc,incl,raan,argp,nu,rp,ra,sme,period,fidout,count);
    
    %Advance onto next line and case within input file
    count=count+1;
end

%Close the opened files
fclose(fidin);
fclose(fidout);

