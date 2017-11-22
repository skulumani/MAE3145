"""HW6 2017 Problem 1
"""
import numpy as np
from astro import constants, manuever

mu = constants.sun.mu
a_e = constants.earth.orbit_sma
a_n = constants.neptune.orbit_sma
km2au = constants.km2au

ecc_e = 0
ecc_n = 0

# circular earth velocity
v_1 = np.sqrt(mu / a_e)
v_2 = np.sqrt(mu / a_n)
# transfer orbit
a_t = .5 * (a_e + a_n)
ecc_t = a_n / a_t - 1

# velocity of transfer orbit at initial and final orbit
sme_t = -mu / (2 * a_t)
vt_1 = np.sqrt(2 * (sme_t + mu / a_e))
vt_2 = np.sqrt(2 * (sme_t + mu / a_n))

(dv_a, dv_b, tof, phase_angle) = manuever.hohmann(
    a_e, a_n, ecc_e, ecc_n, 0, np.pi, mu)

print('Initial Orbit Velocity : {} km/sec'.format(v_1))
print('Final Orbit Velocity : {} km/sec'.format(v_2))
print('Transfer SMA : {} km Eccentricity : {}'.format(a_t, ecc_t))
print('Transfer Periapsis velocity : {} km/sec'.format(vt_1))
print('Transfer Apoapsis velocity : {} km/sec'.format(vt_2))

print('Delta V1 : {} km/sec'.format(dv_a))
print('Delta V2 : {} km/sec'.format(dv_b))
print('TOF : {} sec = {} day = {} yr'.format(tof, tof/86400, tof/86400/365.25))

