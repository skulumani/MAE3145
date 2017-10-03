"""Solve problem 2

"""

from astro import kepler, constants
import numpy as np

mu = constants.earth.mu
r_per = 7000  # km
r_apo = 70000 # km

a, p, ecc = kepler.perapo2aecc(r_per, r_apo)
print('a : {} km, p : {} km, ecc : {}'.format(a, p, ecc))

period = 2 * np.pi * np.sqrt(a**3/mu)
print('period : {} sec'.format(period))

energy = - mu / 2 / a
print('energy : {} km^2/sec^2'.format(energy))

r = 1000 + constants.earth.radius
theta = np.arccos(p / r / ecc - 1 / ecc)
print('nu : +- {} deg'.format(np.rad2deg(theta)))
def velocity(p, ecc, mu, nu):
    vr = np.sqrt(mu/ p) * ecc * np.sin(nu)
    vtheta = np.sqrt(mu/p) * ( 1 + ecc * np.cos(nu))
    return vr, vtheta

vr1, vtheta1 = velocity(p, ecc, mu, theta)
vr2, vtheta2 = velocity(p, ecc, mu, -theta)

print('nu: {} deg - vr: {} km/sec, vt: {} km/sec'.format(np.rad2deg(theta), vr1, vtheta1))
print('nu: {} deg - vr: {} km/sec, vt: {} km/sec'.format(-np.rad2deg(theta), vr2, vtheta2))

