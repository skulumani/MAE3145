"""Script to solve Problem 2 HW 4 2017
"""

import numpy as np
from astro import constants, kepler
import matplotlib.pyplot as plt

re = constants.earth.radius
mu_e = constants.earth.mu

r_p = 1000 + re
ecc = 1.05
nu = np.deg2rad(90)
nu_1 = np.deg2rad(90)
nu_2 = np.deg2rad(150)

a, p = kepler.hyp_per2sma(r_p, ecc)
# compute orbit properties
print("Properties at nu=90")
kepler.orbit_el(p, ecc, 0, 0, 0, nu, mu_e, True)

# plot the orbit
state_eci, state_pqw, state_lvlh, state_sat_eci, state_sat_pqw, state_sat_lvlh = kepler.conic_orbit(p, ecc, 0, 0, 0, -np.deg2rad(135), np.deg2rad(135))

# orbit properties at second nu
print("Properties at nu=150")
kepler.orbit_el(p, ecc, 0, 0, 0, np.deg2rad(150), mu_e, True)

# time of flight
tof = kepler.tof_nu(p, ecc, nu_1, nu_2, mu_e)
print('Time of flight from 90 to 150 deg: {} sec = {} hrs'.format(tof, tof /  3600))

fig, ax =  plt.subplots()
ax.plot(state_pqw[:, 0], state_pqw[:, 1])
ax.plot(re*np.cos(np.linspace(0, 2*np.pi)), re*np.sin(np.linspace(0, 2*np.pi)))
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.axis('equal')
plt.show()

