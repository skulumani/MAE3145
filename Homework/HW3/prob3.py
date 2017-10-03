"""Solve problem 3 from MAE3145 HW 3

Asteroid impact
"""

import numpy as np
from astro import constants
import pdb

mu = constants.earth.mu
re = constants.earth.radius

asteroids = [(1, 1e5),
             (100, 1e5),
             (0, 7e4),
             (0, 8e4),
             (10, 8e4)] # energy, h for several asteroids

for ast in asteroids:
    rp = np.roots((2 * ast[0], 2 * mu, - ast[1]**2))
    print('Asteroid rp: {} km '.format(rp))
    if (np.absolute(rp) < re).any():
        v = np.sqrt(2 * (ast[0] + mu / re))
        print('Velocity at re: {} km/sec'.format(v))
    else:
        v = np.sqrt(2 * ( ast[0] + mu / rp[rp > 0]))
        print('Velocity at re: {} km/sec'.format(v))


# asteroid 1, 2 will impact the earth
