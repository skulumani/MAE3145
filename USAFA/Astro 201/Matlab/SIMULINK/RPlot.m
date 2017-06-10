function RPlot(R)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Use: RPlot(R)
%
% The function RPlot take an array of orbital radius vectors
% and creates a plot of the trajectory around a simple sphereical globe
%
% Author: Dr Ron Lisowski  Sep 2004 USAFA/DFAS  719-333-4109
%
% Inputs:
%   R   - Array of radius vectors (km)
% Outputs:
%   None
%
% Globals: RE from WGS84Data
%
% Constants: None
%
% Coupling: Loads topo.mat data file from MatLab Demos Directory
% 
% References:
%   Astro 201, RVProp assignment, MatLab Demo Directory for Earth map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global RE

% Create the trajectory plot
plot3(R(:,1),R(:,2),R(:,3),'-y','linewidth',2);
hold on;

% Create a sphere of 50 segments
[X,Y,Z]=sphere(50);

%Rescale the sphere to the size of REarth
[t,p,r]=cart2sph(X,Y,Z);
[X,Y,Z]=sph2cart(t,p,r*RE);

%Plot the Earth surface from the sphere
%Method cloned from MatLab Demos Help

load('topo.mat','topo','topomap1');
axis square off equal xy
props.AmbientStrength = 0.1;
props.DiffuseStrength = 1;
props.SpecularColorReflectance = .5;
props.SpecularExponent = 20;
props.SpecularStrength = 1;
props.FaceColor= 'texture';
props.EdgeColor = 'none';
props.FaceLighting = 'phong';
props.Cdata = topo;
surface(X,Y,Z,props);
colormap(topomap1);
view(3)
hold on

%Make the axes nice
axis equal;
axis xy;
% axis off;

%Draw inertial axes
plot3([0 10000],[0 0],[0 0],'k','linewidth',3);
plot3([0 0],[0 10000],[0 0],'k','linewidth',3);
plot3([0 0],[0 0],[0 10000],'k','linewidth',3);

%Enable 3D mouse rotation 
rotate3d on;