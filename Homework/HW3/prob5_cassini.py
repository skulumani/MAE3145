"""Script to generate/solve the Cassini problem
"""
import numpy as np
import spiceypy as spice
from astro import kernels, kepler, time

import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# load cassini and it's kernels
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

# students should generate a plot of the orbit (conic equation)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.plot(state[:, 0], state[:, 1], state[:, 2], 'b-')

plt.show()
