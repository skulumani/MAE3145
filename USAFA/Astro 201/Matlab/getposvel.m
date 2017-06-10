function [V1, V2] = getposvel(filename)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [posvec,velvec]=getposvel('filename')
% 
% This m-file imports vector values only if they are in row form and the
% first three represent the position vector while the next three numbers
% represent the velocity vector.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    filename - name of txt file with vector values 
%
% Outputs:
%    V1 - the first three values inputed from the filename assumed to be a
%    position vector
%    V2 - the last three values inputed from the file assumed to be a
%    velocity vector
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 Lesson 7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Opens the text file as read only
fid = fopen(filename,'rt');

% Inputs the first three values into V1
V1 = fscanf(fid,'%f',3);
% Inputs last three values into V2
V2 = fscanf(fid,'%f',3);

% Close file
fclose(fid);