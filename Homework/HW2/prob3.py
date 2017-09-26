"""
   Purpose: 
       - Calculate solution to AAE 532 PS3 Problem 3

   Inputs: 
       - none

   Outpus: 
       - none

   Dependencies: 
       - aae532_constants.m - planetary constants
       - accel_third.m - third body acceleration

   Author: 
       - Shankar Kulumani 6 Sept 2012
       - Shankar Kulumani 8 Sept 2012
           - use accel_third.m function
        - Shankar Kulumani 26 Sept 2017
            - For MAE3145

   References
       - AAE532_PS3.pdf  
        - MAE3145
"""

from astro import constants, propogator
import numpy as np

# load constants
R = constants.jupiter.orbit_sma

mu_jup = constants.jupiter.mu
mu_sun = constants.sun.mu

mass_ast = 1.4e19 
mass_sun = constants.sun.mass
mass_jup = constants.jupiter.mass
G = constants.G

deg2rad = np.pi/180

# define position vectors. 

r_sun2jup = np.array([R, 0])
r_jup2sun = -r_sun2jup

r_sun2ast = np.array([R/2, R*np.sin(60*deg2rad)])
r_ast2sun = -r_sun2ast

r_ast2jup = np.array([R/2, -R*np.sin(60*deg2rad)])
r_jup2ast = -r_ast2jup

# relative EOM of asteroid wrt to sun

accel_dominant_sun = propogator.accel_twobody(mass_ast,mass_sun,r_sun2ast, G)

accel_direct_sun, accel_indirect_sun, accel_pert_sun = propogator.accel_third(mu_jup,r_ast2jup,r_sun2jup)

# display
print('Relative Acceleration of Asteroid wrt to Sun\n')
print('Dominant Acceleration \n')
print('Accel = {} km/sec^2 \n'.format(accel_dominant_sun))
print('Magnitude = {} km/sec^2 \n'.format(np.linalg.norm(accel_dominant_sun)))
print('Unit Vector = {} km/sec^2 \n'.format(accel_dominant_sun / np.linalg.norm(accel_dominant_sun)))

print('\nPerturbing Acceleration \n')
print('Accel = {} km/sec^2 \n'.format(accel_pert_sun))
print('Magnitude = {} km/sec^2 \n'.format(np.linalg.norm(accel_pert_sun)))
print('Unit Vector = {} km/sec^2 \n'.format(accel_pert_sun / np.linalg.norm(accel_pert_sun)))

# relative EOM of asteroid wrt to Jupiter

accel_dominant_jup = propogator.accel_twobody(mass_ast,mass_jup,r_jup2ast, G)


accel_direct_jup, accel_indirect_jup, accel_pert_jup = propogator.accel_third(mu_sun,r_ast2sun,r_jup2sun)

print('\nRelative Acceleration of Asteroid wrt to Jupiter')
print('\nDominant Acceleration \n')
print('Accel = {} km/sec^2 \n'.format(accel_dominant_jup))
print('Magnitude = {} km/sec^2 \n'.format(np.linalg.norm(accel_dominant_jup)))
print('Unit Vector = {} km/sec^2 \n'.format(accel_dominant_jup / np.linalg.norm(accel_dominant_jup)))

print('\nPerturbing Acceleration \n')
print('Accel = {} km/sec^2 \n'.format(accel_pert_jup))
print('Magnitude = {} km/sec^2 \n'.format(np.linalg.norm(accel_pert_jup)))
print('Unit Vector = {} km/sec^2 \n'.format(accel_pert_jup / np.linalg.norm(accel_pert_jup)))
