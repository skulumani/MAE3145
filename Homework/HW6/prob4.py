"""Hohmann transfer with phasing orbit

HW6 2017 Problem 4
"""
from astro import constants, kepler, maneuver
import numpy as np
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

# hohmann transfer from phasing orbit ot final orbit
v2 = maneuver.vel_mag(rb, rb, mu)
vp2 = maneuver.vel_mag(rb, a_p, mu)
dvb2 = np.absolute(vp2 - v2)
