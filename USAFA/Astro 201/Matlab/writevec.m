function writevec(filename , V , label , comp1, comp2, comp3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: writevec('filename', V , 'label' , 'comp1' , 'comp2','comp3')
% 
% writevec takes the vector V and outputs the variables into the file
% 'filename'.  Each component is followed by a unit vector of the user's
% choice.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    filename - name of text file
%    V - vector with three components to write to file
%    label - name of vector to be printed on first line
%    comp1 - first component label to follow the first component
%    comp2 - second component label to follow the second component
%    comp3 - third component label to follow the third component
%
% Outputs:
%    prints vector v to output file
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: 
%    helps to run getposvel before hand but not required - must have a
%    vector already defined
%
% References:
%    Astro 201 Lesson 7 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open file
fid = fopen(filename,'wt');

% Print first line - label of entire vector
fprintf(fid,'%s\n',label);

% Print first component with label
fprintf(fid,'%8.4f %s %s',V(1),comp1,' ');

% Print second component with label
fprintf(fid,'%8.4f %s %s',V(2),comp2,' ');

% Print third component with label
fprintf(fid,'%8.4f %s %s',V(3),comp3,' ');

% Close file
fclose(fid);