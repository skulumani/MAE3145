%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                            Program Goodintro
%%  Given the initial velocity and elevation angle of a short-range
%%  ballistic missile, this script file will calculate the time of flight,
%%  maximum height, and distance traveled.  It assumes a flat earth,
%%  no drag, and constant acceleration of gravity.
%%
%%    Author       : C3C Shankar Kulumani, USAFA/CS-19, x4741,   17 Jan 07
%%                   
%%    Input        :
%%      V          - Initial velocity magnitude            m/sec
%%      Theta      - Elevation angle                       deg
%%
%%    Output       :
%%      T          - Time of Flight                         sec
%%      D          - Distance Traveled                      m
%%      H          - Maximum Height                         m
%%
%%    Globals:  None
%%
%%    Constants: 
%%      PI         - 3.1415 . . .
%%      g          - gravitational acceleration            m/sec^2
%%
%%    Coupling: None
%%
%%    References   :
%%         Astro 201 Notes Lesson 5
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Establish variables the velocities and angle of launch for the ballistic

V=[175 175 175 275 52.92];
Theta=[40 45 50 10 67.80];

g = 9.81;
% Convert row vector into column vector

V = V';
Theta = Theta';

% Convert from degrees into radians

Theta = Theta * (2 * pi)/360;

% Determine the horizontal and vertical components of launch inputs

for n = 1:5
    Vx(n) = V(n) * cos(Theta(n));
    Vy(n) = V(n) * sin(Theta(n));
end

% Convert the row vectors into column vectors

Vx = Vx';
Vy = Vy';

% Calculate the time of flight, horizontal distance, and vertical distance

for n = 1 : 5
    TFlight(n) = (2 * Vy(n))/g;
    HDist(n) = Vx(n) * TFlight(n);
    VDist(n) = Vy(n)^2 / (2*g);
end    

TFlight = TFlight'
HDist = HDist'
VDist = VDist'