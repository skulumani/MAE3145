"""Script to generate/solve the Cassini problem
"""
import numpy as np
import spiceypy as spice
from astro import kernels, kepler, time, constants

import matplotlib.pyplot as plt
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D

params = {
    'lines.linewidth': 3,
    'axes.labelsize': 16,
    'font.size': 16,
    'legend.fontsize': 16,
    'xtick.labelsize': 16,
    'ytick.labelsize': 16,
    'text.usetex': True,
    'figure.figsize': [8,6],
    'text.latex.unicode': True,
    'text.latex.preamble': ['\\usepackage{siunitx}', '\\usepackage{wasysym}'] 
}   
mpl.rcParams.update(params)
# load cassini and it's kernels
rsaturn = constants.saturn.radius
cass = kernels.CassiniKernels()
spice.furnsh(cass.metakernel)

etOne = spice.str2et('Sep 15, 2004')
etTwo = spice.str2et('Sep 15, 2005')

times = np.linspace(etOne, etTwo, 5000)
state = np.zeros((len(times), 6))
for ii, et in enumerate(times):
    state[ii,:], _= spice.spkezr('Cassini',et , 'J2000', 'None', 'SATURN BARYCENTER')


initial_state = state[0, :]
# comppute position/velocity in the orbital plane
print('Cassini pos: {} km'.format(initial_state[0:3]))
print('Cassini vel: {} km/sec'.format(initial_state[3:6]))

# compute some orbital elements of the vehicle
mu = constants.saturn.mu
p, a, ecc, inc, raan, arg_p, nu, m, arglat, truelon, lonper = kepler.rv2coe(initial_state[0:3], initial_state[3:6], mu)
kepler.orbit_el(p, ecc, inc, raan, arg_p, nu, mu, print_flag=True) 

# students should generate a plot of the orbit (conic equation)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.plot(state[:, 0]/rsaturn, state[:, 1]/rsaturn, state[:, 2]/rsaturn, 'b-')
ax.set_title(r'Cassini Sep 15, 2004 to Sep 15, 2005')
ax.set_xlabel(r'$x (r_{\saturn})$')
ax.set_ylabel(r'$y (r_\saturn})$')
ax.set_zlabel(r'$z (r_{\saturn})$')
plt.show()
