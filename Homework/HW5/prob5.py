"""Hohmann Transfer example Problem 5 HW 5 2017
"""

from astro import constants, kepler, manuever
import numpy as np

mu = constants.earth.mu
# initial orbit
r1 = 1.25 * constants.earth.radius
r2 = 6.6 * constants.earth.radius
at, pt, ecct = kepler.perapo2aecc(r1, r2)

dv1, dv2, tof, phase_angle = manuever.hohmann(r1, r2, 0, 0, 0, np.pi, mu)

S = manuever.synodic_period(r1, r2, mu)
print('DV1 : {} km/sec'.format(dv1))
print('DV2 : {} km/sec'.format(dv2))
print('TOF : {} sec = {} hr'.format(tof, tof/3600))
print('Phase Angle : {} deg'.format(np.rad2deg(phase_angle)))
print('Synodic Period : {} sec = {} hr'.format(S, S/3600))


