"""Get RV vectors for some satellites and print to screen for the problem

"""

import numpy as np
from astro import time, tle, constants, kepler
import pdb

# get TLE
epoch, _ = time.date2jd(2017, 9, 19, 19, 0, 0)
sats = tle.get_tle('prob7_tle.txt')
for sat in sats:
    # get RV vector
    sat.tle_update(epoch, mu=constants.earth.mu)
    
    r_eci = sat.r_eci
    v_eci = sat.v_eci

    # get orbital paramters
    param_string = kepler.orbit_el(sat.coe.p, sat.coe.ecc, sat.coe.inc, sat.coe.raan, sat.coe.argp, sat.coe.nu, constants.earth.mu)

    print(sat.satname, sat.satnum)
    print(param_string)

with open('./prob7_rv.txt', 'w') as ofile:
    for sat in sats:
        ofile.write('{:16.6f} {:16.6f} {:16.6f} {:16.6f} {:16.6f} {:16.6f}\n'.format(sat.r_eci[0],
                                                 sat.r_eci[1],
                                                 sat.r_eci[2],
                                                 sat.v_eci[0],
                                                 sat.v_eci[1],
                                                 sat.v_eci[2]))
    
