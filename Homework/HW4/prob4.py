"""Problem 4 HW4 2017
"""

from astro import kepler, constants
import numpy as np
import matplotlib.pyplot as plt

re = constants.earth.radius
mu = constants.earth.mu

r = np.array([3 * re, 5 * re, 0])
v = np.array([-3.2, 2.0, 2.5])

p, a, ecc, inc, raan, arg_p, nu, _, _, _ ,_ = kepler.rv2coe(r, v, mu)

kepler.orbit_el(p, ecc, inc, raan, arg_p, nu, mu, True)

state_eci, state_pqw, state_lvlh, state_sat_eci, state_sat_pqw, state_sat_lvlh = kepler.conic_orbit(p, ecc, inc, raan, arg_p, nu, nu)

fig, ax =  plt.subplots()
ax.plot(state_pqw[:, 0], state_pqw[:, 1])
ax.plot(re*np.cos(np.linspace(0, 2*np.pi)), re*np.sin(np.linspace(0, 2*np.pi)))
ax.plot([0, state_sat_pqw[0]], [0, state_sat_pqw[1]], 'b-', linewidth=3)
ax.plot(state_sat_pqw[0], state_sat_pqw[1], 'b.', markersize=20)
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.axis('equal')
plt.show()
