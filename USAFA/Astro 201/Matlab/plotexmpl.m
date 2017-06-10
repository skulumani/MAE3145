%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: plotexmpl.m
% 
% This script file creates two plots one 2-D and one 3-D.
%
% Author:   C3C Shankar Kulumani   USAFA/CS-19   719-333-4741
%
% Inputs:
%    none
%
% Outputs:
%    Figure 1 - 2D plot
%    Figure 2 - 3D Plot
% 
% Globals: None
% 
% Constants: None
% 
% Coupling: None
%
% References:
%    Astro 201 Lesson 27
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t=0:pi/50:10*pi;
x=sin(t);
y=cos(t);

figure(2)
plot3(x,y,t)

figure(1)
plot(x,y)
xlim([-2,2])
ylim([-2,2])
title('2-D Plot')
xlabel('X-Axis')
ylabel('Y-Axis')

hold on
plot(t,x)