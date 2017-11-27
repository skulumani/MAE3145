"""Hohmann transfer with phasing orbit

HW6 2017 Problem 4
"""
from astro import constants, kepler, maneuver
import numpy as np
import matplotlib.pyplot as plt

import pdb
ra = 7000
rb =14000
mu = constants.earth.mu

# define hyperbolic arrival orbit
va1 = 12
e_h = va1**2 / 2 - mu/ra
a_h = - mu / e_h / 2
ecc_h = ra / np.absolute(a_h) + 1
p_h = kepler.semilatus_rectum(np.absolute(a_h), ecc_h)
nu_h = 0

# hohmann transfer from hyperbolic orbit to circular orbit rb
a_t, p_t, ecc_t = kepler.perapo2aecc(ra, rb)
vt1 = maneuver.vel_mag(ra, a_t, mu)
dva1, _, toft, phaset = maneuver.hohmann(ra, rb, ecc_h, 0, 0, 0, mu)

# final orbit mean motion
n2 = np.sqrt(mu / rb**3)
angle = n2 * toft
p2 = 2*np.pi * np.sqrt(rb**3 / mu)

phasing_period = p2 - toft

# design of phasing orbit
a_p = kepler.period2sma(phasing_period, mu)
rc = a_p *2 - rb
a_p, p_p, ecc_p = kepler.perapo2aecc(rc, rb)

# hohmann from transfer ellipse to phasing orbit
vt2 = maneuver.vel_mag(rb, a_t, mu)
vp1 = maneuver.vel_mag(rb, a_p, mu)
dvb1 = np.absolute(vp1 - vt2)
# TODO: Add print statements adn orbit properties print outs

# hohmann transfer from phasing orbit ot final orbit
v2 = maneuver.vel_mag(rb, rb, mu)
vp2 = maneuver.vel_mag(rb, a_p, mu)
dvb2 = np.absolute(vp2 - v2)

# print some data
print('Transfer ellipse : a = {} km, e = {}'.format(a_t, ecc_t))
print('VT1 : {} km/sec'.format(vt1))
print('V1 : {} km/sec'.format(va1))
print('DV1 : {} km/sec'.format(np.absolute(dva1)))
print('TOF : {} sec = {} hr'.format(toft, toft/3600))

print('\nPhasing Orbit')
print('Period Phasing : {} sec'.format(phasing_period))
print('Phasing orbit : a = {} km, ecc = {}'.format(a_p, ecc_p))

print('\nTransfer from hohmann ellipse to phasing orbit')
print('DV2 : {} km/sec'.format(dvb1))
print('\nTransfer from phasing orbit to final orbit')
print('DV3 : {} km/sec'.format(dvb2))

# generate a plot of the orbit
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(np.absolute(p_h), ecc_h, 0, 0, 0, -np.deg2rad(10), np.deg2rad(10), mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(p_t, ecc_t, 0, 0, 0, 0, 0, mu)
_, state_pqw3, _, _, sat_pqw3, _ = kepler.conic_orbit(rb, 0, 0, 0, 0, 0, 0, mu)
_, state_pqw4, _, _, sat_pqw4, _ = kepler.conic_orbit(p_p, ecc_p, 0, 0, 0, 0, 0, mu)

# rotate new orbit 
fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Initial')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Transfer')
ax.plot(state_pqw3[:, 0], state_pqw3[:, 1], label='Final')
ax.plot(state_pqw4[:, 0], state_pqw4[:, 1], label='Phasing')

ax.set_title('Hyperbolic Arrival and Rendezvous')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.axis('equal')
plt.legend()
plt.show()
