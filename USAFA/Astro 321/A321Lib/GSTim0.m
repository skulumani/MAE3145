function GST0=GSTim0(Yr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  Use           : GST0=GSTim0(Yr)
%%
%%  This function finds the Greenwich Sidereal time at the beginning of a year.
%%    This formula is derived from the Astronomical Almanac and is good only for
%%    0 hr UT, 1 Jan of a year.
%%
%%  Algorithm     : Find the Julian Date Ref 4713 BC
%%                  Perform expansion calculation to obtain the answer
%%                  Check the answer for the correct quadrant and size
%%
%%  Author        : Capt Dave Vallado  USAFA/DFAS  719-472-4109   12 Feb 1989
%%  In Ada        : Dr Ron Lisowski    USAFA/DFAS  719-472-4110   17 May 1995
%%  In MatLab     : LtCol Thomas Yoder USAFA/DFAS  719-333-4110   Spring 2000
%%
%%  Inputs        :
%%    Yr          - Year                                 1988, 1989, etc.
%%
%%  OutPuts       :
%%    GST0        - Returned Greenwich Sidereal Time     0 to 2Pi rad
%%
%%  Locals        :
%%    JD          - Julian Date                          days from 4713 B.C.
%%    Tu          - Julian Centuries from 1 Jan 2000
%%
%%  Constants     :
%%    TwoPI         Two times Pi (DFASmath.m constant)
%%
%%  Coupling      :
%%    mod			  MatLab modulus function
%%
%%  References    :
%%    1989 Astronomical Almanac pg. B6
%%    Escobal       pg. 18 - 21
%%    Explanatory Supplement pg. 73-75
%%    Kaplan        pg. 330-332
%%    BMW           pg. 103-104
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
global TwoPI

     JD = 367.0 * Yr - fix(7.0 * (Yr+fix(10.0/12.0)) *0.25) + fix(275.0/9.0) + 1721014.5;
     Tu = (fix(JD) + 0.5 - 2451545.0) / 36525.0;
     GST0= 1.753368559 + 628.3319705*Tu + 6.770708127E-06*Tu*Tu;

%%%%%%%%%%%%%%%%%%%%%%- Check quadrants %%%%%%%%%%%%%%%%%%%%-
     GST0= revcheck(GST0,TwoPI);
%%     if GST0 < 0.0
%%         GST0= GST0 + TwoPI;
%%     end
