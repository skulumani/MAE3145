import numpy as np
from astro import kepler, constants

mu = constants.earth.mu
r = np.array([0, -26560, 0])
v = np.array([2.5, 0, 2.5])

p, a, ecc, inc, raan, arg_p, nu, m, arglat, truelon, lonper = kepler.rv2coe(r, v, mu)

string = kepler.orbit_el(p, ecc, inc, raan, arg_p, nu, mu, False)

print(string)
