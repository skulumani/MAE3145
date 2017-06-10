%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: COE_Propogation
% 
% This script file reads R and V vectors from a text file and outputs the
% corresponding future COEs given a time of flight.
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
%       Mechanical Energay, and Period
%    RVRead.m - reads the R and V vectors from and input text file
%    COEPrint.m - prints the COE along with the extra information into a
%       text file called COE.txt
%
% References:
%    Astro 201 COE propogation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Open constants and equations script file
WGS84Data

%Open text files for reading and writing
fidin = fopen('RVTOF.txt','rt');
fidout = fopen('COEProp.txt','wt');

%Initialize count - keeps track of mulitple R and V vectors
count =1;

%Continue to run while not at end of file
while not(feof(fidin))
    %Read in R and V vector from input file
    [Ri Vi tof] =RVread(fidin);
    
    %Call ElOrb to calulate COE
    [ai, ecci, incli, raani, argpi, nui] = ElOrb(Ri,Vi);
    
    %Call OrbParams to calculate non COE values
    [rp,ra,sme,period] =OrbParams(ai,ecci);
    
    %Call Update to propogate the COE to a future time
    [af eccf inclf raanf argpf nuf]=Update(ai,ecci,incli,raani,argpi,nui,tof);
    
    %Call COEprint to print all values to output file
    COEprint(Ri,Vi,af, eccf,inclf,raanf,argpf,nui,nuf,rp,ra,sme,period,tof,fidout,count);
    
    %Advance onto next line and case within input file
    count=count+1;
end

%Close the opened files
fclose(fidin);
fclose(fidout);

