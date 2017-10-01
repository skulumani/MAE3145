"""Solve problem 6
"""

import numpy as np
from astro import constants

mu = constants.earth.mu
alt = 120
a = constants.earth.radius + alt

vc = np.sqrt(mu / a)
vesc = np.sqrt(2) * vc

print("Circular velocity at {} km : {} km/sec".format(a, vc))
print("Escape velocity at {} km : {} km/sec".format(a, vesc))
print("Delta V : {} km/sec required at {} km from circular orbit".format(vesc-vc, a))

ecc = 0.3
nu = np.deg2rad(145)
p = a * ( 1 - ecc**2)
r = (a * (1 - ecc**2)) /(1 + ecc* np.cos(nu))
vr = np.sqrt(mu/p) * ecc * np.sin(nu)
vtheta = np.sqrt(mu/p) * ( 1 + ecc * np.cos(nu))
v = np.sqrt(vr**2 + vtheta**2)
vesc_ellip = np.sqrt(2) * np.sqrt(mu / r)

print('Radius in elliptical orbit: {} km'.format(r))
print('Velocity magnitude : {} km/sec'.format(v))
print('Velocity escape at {} km : {} km/sec'.format(r, vesc_ellip))
print('Delta V : {} km/sec required at {} km from elliptical orbit'.format(vesc_ellip - v, r))
