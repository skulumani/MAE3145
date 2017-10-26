"""Script to solve Problem 1 HW4 2017

Shankar Kulumani
"""

import numpy as np
from astro import kepler, time, constants
import pdb

# time of last perihelion passage from JPL
jd_per = 2446467.395317050925
date_per = time.jd2date(jd_per)

# properties of Halley's comet
au2km  = constants.au2km
a = 17.834144 # au
ecc = 0.9671429
p = kepler.semilatus_rectum(a, ecc)
inc = np.deg2rad(162.262690579161)
raan = np.deg2rad(58.42008097656843)
argp = np.deg2rad(111.3324851045177)
M = np.deg2rad(38.3842644764388)
pdb.set_trace()

E, nu, _ = kepler.kepler_eq_E(M, ecc)
mu = constants.sun.mu

# properties at perihelion
print('Properties at Perihelion')
kepler.orbit_el(p, ecc, inc, raan, argp, nu, mu, True)

# properties at next observation occurs at nu = 260 deg

# compute time to go from last perihelion to nu = 260 and then to perihelion


