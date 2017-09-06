"""This script will input RV1.txt and print to another text file the output
that the students should generate 
"""

from astro import kepler, constants, tle, time
import numpy as np

import pdb



def solution(infile='./data/RV1.txt', outfile='./data/RV1.out'):
    """Generate the solution that the students should output
    
    """
    mu = constants.earth.mu
    output_string = '' 
    with open(infile, 'r') as f:
        line = f.readline().split()
        while line:
            r_in = np.array([float(i) for i in line[0:3]])
            v_in = np.array([float(i) for i in line[3:6]])
                 
            # convert to coes
            p, a, ecc, inc, raan, arg_p, nu, _, _, _, _ = kepler.rv2coe(r_in, v_in, mu) 

            # compute orbit properties
            prop_string = kepler.orbit_el(p, ecc, inc, raan, arg_p, nu, mu)

            # print to text file
            output_string += prop_string

            # read the next line
            line = f.readline().split()

    with open(outfile, 'w') as f:
       f.write(output_string)

def generate_data(tle_file='./data/RV2COE_tle.txt', outfile='./data/RV2COE_tle_rv.txt'):
    """Generate test inputs and outputs for the students
    
    Uses a saved TLE file - can get more using tle.get_tle_spacetrack(outfile, 'rv2coe')

    """
    jd_start, _ = time.date2jd(2017, 9, 1, 0, 0, 0)  # time in UTC
    jd_end, _ = time.date2jd(2017, 9, 11, 0, 0, 0)
    jd_step =  10 / (24 * 60)
    jd_span = np.arange(jd_start, jd_end, jd_step)

    # read some TLEs and get the state vector and write to a file
    sats = tle.get_tle(tle_file)
    # get the orbital elements for each satellite in TLE list
    with open(outfile, 'w') as f:
        for sat in sats:
            # propogate for several time periods and get the r, v vectors
            sat.tle_update(jd_span)
            r_arr = sat.r_eci
            v_arr = sat.v_eci

            # format and write to a text file
            for r, v in zip(r_arr[0::10], v_arr[0::10]):
                f.write('{:16.6f} {:16.6f} {:16.6f} {:16.6f} {:16.6f} {:16.6f}\n'.format(r[0], r[1], r[2], v[0], v[1], v[2]))



