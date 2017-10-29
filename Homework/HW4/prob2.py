"""Script to solve Problem 2 HW 4 2017
"""

import numpy as np
from astro import constants, kepler


re = constants.earth.radius
mu_e = constants.earth.mu

r_p = 1000 + re
ecc = 1.05
nu = np.deg2rad(90)

a, p = kepler.hyp_per2sma(r_p, ecc)
# compute orbit properties
kepler.orbit_el(p, ecc, 0, 0, 0, nu, mu_e, True)

