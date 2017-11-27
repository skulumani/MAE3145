"""Hohmann Transfer example Problem 5 HW 5 2017
"""

from astro import constants, kepler, maneuver
import numpy as np

mu = constants.earth.mu
# initial orbit
r1 = 1.25 * constants.earth.radius
r2 = 6.6 * constants.earth.radius
at, pt, ecct = kepler.perapo2aecc(r1, r2)

v1 = maneuver.vel_mag(r1, r1, mu)
v2 = maneuver.vel_mag(r2, r2, mu)
dv1, dv2, tof, phase_angle =maneuver.hohmann(r1, r2, 0, 0, 0, np.pi, mu)

S = maneuver.synodic_period(r1, r2, mu)
print('V1 : {} km/sec'.format(v1))
print('DV1 : {} km/sec'.format(dv1))
print('V2 : {} km/sec'.format(v2))
print('DV2 : {} km/sec'.format(dv2))
print('TOF : {} sec = {} hr'.format(tof, tof/3600))
print('Phase Angle : {} deg'.format(np.rad2deg(phase_angle)))
print('Synodic Period : {} sec = {} hr'.format(S, S/3600))


