"""MAE3145 HW2 2017

Look at constants sheet
"""
from astro import constants, propogator
import numpy as np
# load constants

G = constants.G
mu_jup = constants.jupiter.mu
mass_juno = 3625
mu_cal = constants.callisto.mu
mu_sun  = constants.sun.mu

# determine relative position vectors

r_jup2sun = -constants.jupiter.orbit_sma * np.array([1, 0, 0])
r_juno2cal = 4000 * np.array([1, 0, 0])
r_jup2cal = -constants.callisto.orbit_sma * np.array([1, 0, 0])
r_jup2juno = r_jup2cal-r_juno2cal
r_juno2sun = r_jup2sun-r_jup2juno

# determine dominant accelerations relative to jupiter
accel_dominant = -(G*mass_juno+mu_jup)/np.linalg.norm(r_jup2juno)**3*r_jup2juno

# perturbing acceleration due to sun
accel_direct_sun, accel_indirect_sun, accel_pert_sun = propogator.accel_third(mu_sun,r_juno2sun,r_jup2sun)

# perturbing acceleration due to callisto
accel_direct_cal, accel_indirect_cal, accel_pert_cal = propogator.accel_third(mu_cal,r_juno2cal,r_jup2cal)

# display answers
print('Relative Acceleration of Juno wrt to Jupiter')

print('Dominant Accel = {} km/sec^2'.format(accel_dominant))

print('\nPerturbing Accel due to Sun\n')
print('Direct Accel = {} km/sec^2\n'.format(accel_direct_sun))
print('Indirect Accel = {} km/sec^2\n'.format(accel_indirect_sun))
print('Perturbing Accel = {} km/sec^2\n'.format(accel_pert_sun))

print('\nPerturbing Accel due to Callisto\n')
print('Direct Accel = {} km/sec^2\n'.format(accel_direct_cal))
print('Indirect Accel = {} km/sec^2\n'.format(accel_indirect_cal))
print('Perturbing Accel = {} km/sec^2\n'.format(accel_pert_cal))
