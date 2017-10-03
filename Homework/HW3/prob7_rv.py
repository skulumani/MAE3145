"""Get RV vectors for some satellites and print to screen for the problem

"""

import numpy as np
from astro import time, tle, constants, kepler

import matplotlib.pyplot as plt
import pdb

# open the output file
ofile = open('./prob7_rv.txt', 'w')
answer_file = open('./prob7_solution.txt', 'w')

# get TLE
epoch, _ = time.date2jd(2017, 9, 19, 19, 0, 0)
sats = tle.get_tle('prob7_tle.txt')
for sat in sats:
    # get RV vector
    sat.tle_update(epoch, mu=constants.earth.mu)
    
    (a, h, period, sme, fpa, r_per, r_apo, r_ijk, v_ijk,
        r_pqw, v_pqw, r_lvlh, v_lvlh, r, v, v_circ, v_esc,
        E, M, n) = kepler.elp_orbit_el(sat.coe.p, sat.coe.ecc, sat.coe.inc, 
                                sat.coe.raan, sat.coe.argp, sat.coe.nu, 
                                constants.earth.mu)
    
    ofile.write('{:10.6f} {:10.6f} {:10.6f} {:10.6f} {:10.6f} {:10.6f}\n'.format(
        r_lvlh[0],
        r_lvlh[1],
        r_lvlh[2],
        v_lvlh[0],
        v_lvlh[1],
        v_lvlh[2]))

    # get orbital paramters
    param_string = kepler.orbit_el(sat.coe.p, sat.coe.ecc, sat.coe.inc, sat.coe.raan, sat.coe.argp, sat.coe.nu, constants.earth.mu)
    
    answer_file.write('\n{} {}\n{}'.format(sat.satname, sat.satnum, param_string))

    print(sat.satname, sat.satnum)
    print(param_string)
    
    # create the plot of the orbit in the PQW reference frame
    pos_eci, sat_eci, pos_pqw, sat_pqw = kepler.conic_orbit(sat.coe.p, sat.coe.ecc, sat.coe.inc,
                                             sat.coe.raan, sat.coe.argp, sat.coe.nu, sat.coe.nu)

    fig, ax = plt.subplots()
    ax.plot(pos_pqw[:, 0], pos_pqw[:, 1])
    ax.plot(sat_pqw[0], sat_pqw[1], 'bo', markersize=9)
    ax.plot(0, 0, 'ko', markersize=20)
    ax.set_title(sat.satname)
    ax.set_xlabel(r'$ \hat p (km)$')
    ax.set_ylabel(r'$ \hat q (km)$')
    plt.axis('equal')
    plt.grid()
    plt.savefig(str(sat.satnum) + '.pdf')

ofile.close()
answer_file.close()
plt.show()
    
