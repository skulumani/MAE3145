"""Solution for PROPOGATE project

"""

import numpy as np
from astro import constants, kepler, time, tle
import pdb


def solution(infile='./data/RV2.txt', outfile='./data/RV2_solution.txt'):
    """Generate the solution that students should be able to match

    """
    mu = constants.earth.mu

    output_string = ''
    with open(infile, 'r') as f:
        line = f.readline().split()
        while line:
            r_in = np.array([float(i) for i in line[0:3]])
            v_in = np.array([float(i) for i in line[3:6]])
            dt = float(line[6])

            # convert to coe
            p, a, ecc, inc, raan, arg_p, nu, _, _, _, _ = kepler.rv2coe(r_in, v_in, mu)

            # propagate forward 
            E_f, M_f, nu_f = kepler.tof_delta_t(p, ecc, mu, nu, dt) 

            # compute elements at future time
            prop_string = kepler.orbit_el(p, ecc, inc, raan, arg_p, nu_f, mu)

            output_string += prop_string

            line = f.readline().split()
    
    with open(outfile, 'w') as f:
        f.write(output_string)

def generate_data(tle_file='./data/PROPAGATE_tle.txt', outfile='./data/PROPOGATE_tle_rvt.txt'):
    """Generate big text file for students to be graded on

    Uses a saved TLE  file - get more using tle.get_tle_spacetrack(outfile, 'rv2coe')
    """
    jd_start, _ = time.date2jd(2018, 11, 14, 0, 0, 0)
    jd_end, _ = time.date2jd(2018, 11, 27, 0, 0, 0)
    jd_step = 100 / (24 * 60)
    jd_span = np.arange(jd_start, jd_end, jd_step)

    # read the tles
    sats = tle.get_tle(tle_file)

    with open(outfile, 'w') as f:
        for sat in sats:
            sat.tle_update(jd_span)
            r_arr = sat.r_eci
            v_arr = sat.v_eci
            # just write the position and velocity vector to a text file
            for r, v in zip(r_arr[0::10], v_arr[0::10]):
                f.write('{:16.6f} {:16.6f} {:16.6f} {:16.6f} {:16.6f} {:16.6f} {:16.6f}\n'.format(
                    r[0], r[1], r[2], v[0], v[1], v[2], np.random.randint(1, 86400)))
