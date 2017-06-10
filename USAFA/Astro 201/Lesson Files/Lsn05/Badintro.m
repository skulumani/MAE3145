%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                            Program BadIntro
%%  Given the initial velocity and elevation angle of a short-range
%%  ballistic missile, this script file will calculate the time of flight,
%%  maximum height, and distance traveled.  It assumes a flat earth,
%%  no drag, and constant acceleration of gravity.
%%
%%    Author       : Capt Brown, DFAS, x4431,   17 Jan 96
%%                   Modified by Capt Sandfry   24 Jun 96
%%                       -  input/output via data files
%%                       -  input data loop
%%                       -  output data subroutine
%%                   Modified by Lt Col Tom Yoder for Matlab
%%                   Modified by Maj Joel Miller for A201
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
%%         Astro 201 Notes Lesson 6
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Establish variables the velocities and angle of launch for the ballistic

V=[175 175 175 275 52.92];
Theta=[40 45 50 10 67.80];


%%%%%% Assign Values %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=9.81;

%%%%%% Read in Data (Velocity in m/s, el angle in deg) %%%%%%%%%%
for I = 1:5
    I %prints the value of I to the screen
   
   %%%%%% Main Calculations%%%%%%%%%%%%%%%%%%%
   ThetaRad=TheTa(1,I)*Pi/180;
   Vx=V(1,I)*cos[ThetaRAD]
   Vy=V(1,I)*sin[ThetaRad]
   T=((Vy)/G))^2
   H=Vy^2/2.0*G
   D=Vx*T
   
   
   
end

