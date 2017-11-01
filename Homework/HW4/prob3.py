"""Problem 3 HW4 2017
"""

from astro import kepler, constants
import numpy as np
import matplotlib.pyplot as plt

# define orbital elements
a = 3 * constants.earth.radius
ecc = 0.4
p = kepler.semilatus_rectum(a, ecc)
inc = np.deg2rad(28.5)
raan = np.deg2rad(45)
argp = np.deg2rad(90)
nu = np.deg2rad(235)

mu = constants.earth.radius
re = constants.earth.radius
output = kepler.orbit_el(p, ecc, inc, raan, argp, nu, mu, True)

# generate a plot of orbit plane
# plot the orbit
state_eci, state_pqw, state_lvlh, state_sat_eci, state_sat_pqw, state_sat_lvlh = kepler.conic_orbit(p, ecc, inc, raan, argp, nu, nu)

fig, ax =  plt.subplots()
ax.plot(state_pqw[:, 0], state_pqw[:, 1])
ax.plot(re*np.cos(np.linspace(0, 2*np.pi)), re*np.sin(np.linspace(0, 2*np.pi)))
ax.plot([0, state_sat_pqw[0]], [0, state_sat_pqw[1]], 'b-', linewidth=3)
ax.plot(state_sat_pqw[0], state_sat_pqw[1], 'b.', markersize=20)
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.axis('equal')
plt.show()

with open('prob3_sol.txt', 'w') as f:
    f.write(output)
