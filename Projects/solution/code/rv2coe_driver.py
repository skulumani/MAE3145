"""This script will input RV1.txt and print to another text file the output
that the students should generate 
"""

from astro import kepler, constants
import pdb



def solution(filename='./data/RV1.txt'):
    """Generate the solution that the students should output
    
    """
    mu = constants.earth.mu

    with open(filename, 'r') as f:
        line = f.readline().split()
        while line:
            r_in = np.array([float(i) for i in line[0:3]])
            v_in = np.array([float(i) for i in line[3:6]])
                 
            # convert to coes
            p, a, ecc, inc, raan, arg_p, nu, _, _, _, _ = kepler.rv2coe(r_in, v_in, mu) 


            # print to text file
            line = f.readline()

def generate_data(outfile):
    """Generate test inputs and outputs for the students

    """

    pass


