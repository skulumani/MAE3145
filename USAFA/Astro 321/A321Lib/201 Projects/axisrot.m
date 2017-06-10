function [B]=axisrot(A,axis,alpha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: [B]=axisrot(A,axis,alpha)
%
% The function axisrot rotatates vector A around axis the 
% amount of alpha degrees
%
% Author: Scott Dahlke  USAFA/DFAS  719-333-4110
%
% Inputs:
%   A - input vector
%   axis - axis number about which to rotate (1,2 or 3)
%   alpha - the angle to rotate (rad)
%
% Outputs:
%   B - the vector A described in the new ref frame
%
% Globals: None
%
% Constants: None
%
% Coupling: None
% 
% References:
%   COE's to RV Lesson of Astro 201
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if axis == 1         % rotate about the first axis
  B = [1 0 0; 0 cos(alpha) sin(alpha); 0 -sin(alpha) cos(alpha)]*A;  
elseif axis == 2     % rotate about the second axis
  B = [cos(alpha) 0 -sin(alpha); 0 1 0; sin(alpha) 0 cos(alpha)]*A;  
elseif axis == 3     % rotate about the third axis
  B = [cos(alpha) sin(alpha) 0; -sin(alpha) cos(alpha) 0; 0 0 1]*A;  
else                 % print error message
  disp('Error in axisrot! axis must be 1, 2 or 3');
end;
