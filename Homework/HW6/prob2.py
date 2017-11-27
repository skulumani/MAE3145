"""Solve bielliptical problem 2 2017 HW6
"""
from astro import kepler, maneuver, constants 
import numpy as np

mu = constants.moon.mu
rm = constants.moon.radius
r1 = 100 + rm
r2 = 100 + rm
ri = 17000

delta_inc = np.pi/2

v1 = maneuver.vel_mag(r1, r1,  mu)
v2 = maneuver.vel_mag(r2, r2, mu)

# bielliptical transfer orbit
a_bi, p_bi, ecc_bi= kepler.perapo2aecc(r1, ri)

# simple plane change at current altitude
dv_current = maneuver.simple_plane_change(v1, delta_inc)

# first manuever
v1_bi = maneuver.vel_mag(r1, a_bi, mu)
dv1 = np.absolute(v1 - v1_bi)

# plane change at apoapsis of bielliptical transfer
v2_bi = maneuver.vel_mag(ri, a_bi, mu)
dv2 = maneuver.simple_plane_change(v2_bi, delta_inc)


# third maneuver circularize at same altitude in polar oribt
v3_bi = maneuver.vel_mag(r2, a_bi, mu)
dv3 = np.absolute(v2 - v3_bi)

dv_bielliptical = dv1 + dv2 + dv3
tof_bielliptical = 2 *  np.pi * ( np.sqrt(a_bi**3/mu) )

print('Simple plane change at current altitude')
print('DV : {} km/sec'.format(dv_current))
print('\nBielliptical Plane change')
print('DV1 : {} km/sec'.format(dv1))
print('DV2 : {} km/sec'.format(dv2))
print('DV3 : {} km/sec'.format(dv3))

print('TOF : {} sec = {} hr'.format(tof_bielliptical, tof_bielliptical/3600))
