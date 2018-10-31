import numpy as np
from astro import kepler, constants

mu = constants.earth.mu
p = 0.23 * constants.earth.radius
e = 0.82
inc = np.pi/2
raan = np.deg2rad(180)
arg_p = np.deg2rad(260)
nu = np.deg2rad(190)

string = kepler.orbit_el(p, e, inc, raan, arg_p, nu, mu, False)
print(string)
