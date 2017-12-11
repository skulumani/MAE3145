"""Script to solve Problem 1 HW5_2017
"""
import pdb
import numpy as np
from astro import constants, manuever, kepler
import matplotlib.pyplot as plt
from kinematics import attitude

re2km = constants.re2km
mu = constants.earth.mu
hr2sec = constants.hr2sec

# orbital parameters
mag_r = 4 * re2km
mag_v = 4.54 # km/sec
fpa = np.deg2rad(-40)
tof = 8.5 * hr2sec

delta_v = 1.2
alpha = np.deg2rad(30)
beta = np.pi - alpha

# colculate some elements
a, p, ecc, nu = manuever.rvfpa2orbit_el(mag_r, mag_v, fpa, mu)
print('Initial Orbital Elements')
kepler.orbit_el(p, ecc, 0, 0, 0, nu, mu, True)

# propogate to a new point in the orbit
Ef, Mf, nuf = kepler.tof_delta_t(p, ecc, mu, nu, tof)

# orbital elements just before the burn
print('Orbital Elements just before burn')
kepler.orbit_el(p, ecc, 0, 0, 0, nuf, mu, True)
out = kepler.elp_orbit_el(p, ecc, 0, 0, 0, nuf, mu)
r1 = np.linalg.norm(out[7])
v1 = np.linalg.norm(out[8])
fpa1 = out[4]

# compute burn
rf, vf, fpaf = manuever.single_impulse(r1, v1, fpa1, delta_v, alpha)
an, pn, eccn, nun = manuever.rvfpa2orbit_el(rf, vf, fpaf, mu)
delta_arg_p = nuf - nun
print('Orbital Elements after burn')
kepler.orbit_el(pn, eccn, 0, 0, delta_arg_p, nun, mu, True)

# generate a plot of the orbit
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(p, ecc, 0, 0, 0, nuf, nuf, mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(pn, eccn, 0, 0, 0, nun, nun, mu)

# rotate the second orbit by the change in argument of perigee
rot_old2new = attitude.rot3(delta_arg_p)
state_pqw2 = rot_old2new.dot(state_pqw2[:, 0:3].T).T
sat_pqw2 = rot_old2new.dot(sat_pqw2[0:3])
fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Initial')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Final')

ax.plot([0, sat_pqw2[0]], [0, sat_pqw2[1]], 'b.-', markersize=10)
ax.set_title('Single Impulse Manuever')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.legend()
plt.show()

