"""Script to solve problem 2 2017 HW6
"""
import numpy as np
from astro import constants, kepler, manuever
import matplotlib.pyplot as plt

mu = constants.earth.mu
re2km = constants.re2km
deg2rad = constants.deg2rad
rad2deg = constants.rad2deg

# initial orbit parameters
a_1 =6*re2km
ecc_1 = .5
nu_0 = 0
p_1 = a_1*(1-ecc_1**2)


# desired orbit altitude - location of manuever
r_1 = 7.6*re2km
# find intersection of original orbit and desired orbit - true anomaly
nu_1 = kepler.nu_solve(p_1, ecc_1, r_1)

# conditions of orbit just prior to burn
print('Initial Orbit prior to manuever')
kepler.orbit_el(p_1, ecc_1, 0, 0, 0, nu_1[0], mu, 'True')
_,_, r1_pqw, v1_pqw= kepler.coe2rv(p_1, ecc_1, 0, 0, 0, nu_1[0], mu)
fpa1 = kepler.fpa_solve(nu_1[0], ecc_1)

# properties of desired orbit at manuever point
r_2 = r_1
ecc_2 = 0
_,_, r2_pqw, v2_pqw= kepler.coe2rv(r_2, ecc_2, 0, 0, 0, nu_1[0], mu)

delta_v, alpha, beta = manuever.delta_v_solve_planar(np.linalg.norm(v1_pqw),
                                                     np.linalg.norm(v2_pqw),
                                                     fpa1, 0)
print('Delta V: {} km/sec'.format(delta_v))
print('Alpha: {} deg, Beta: {} deg'.format(np.rad2deg(alpha), np.rad2deg(beta)))
# final orbit properties
print('Final Orbit after manuever')
kepler.orbit_el(r_2, ecc_2, 0, 0, 0, nu_1[0], mu, 'True')

# create the plot
# generate a plot of the orbit
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(p_1, ecc_1, 0, 0, 0, nu_1[0], nu_1[0], mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(r_2, ecc_2, 0, 0, 0, 0, 0, mu)

# rotate the second orbit by the change in argument of perigee
fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Initial')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Final')

ax.plot([0, sat_pqw1[0]], [0, sat_pqw1[1]], 'b.-', markersize=10)
ax.set_title('Single Impulse Manuever')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.legend()
plt.show()
