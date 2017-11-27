"""HW6 2017 Problem 1
"""
import numpy as np
from astro import constants, maneuver, kepler
import matplotlib.pyplot as plt

mu = constants.sun.mu
a_e = constants.earth.orbit_sma
a_n = constants.neptune.orbit_sma
km2au = constants.km2au

ecc_e = 0
ecc_n = 0

# circular earth velocity
v_1 = np.sqrt(mu / a_e)
v_2 = np.sqrt(mu / a_n)
# transfer orbit
a_t = .5 * (a_e + a_n)
ecc_t = a_n / a_t - 1
p_t = kepler.semilatus_rectum(a_t, ecc_t)
# velocity of transfer orbit at initial and final orbit
sme_t = -mu / (2 * a_t)
vt_1 = np.sqrt(2 * (sme_t + mu / a_e))
vt_2 = np.sqrt(2 * (sme_t + mu / a_n))

(dv_a, dv_b, tof, phase_angle) = maneuver.hohmann(
    a_e, a_n, ecc_e, ecc_n, 0, np.pi, mu)

print('Initial Orbit Velocity : {} km/sec'.format(v_1))
print('Final Orbit Velocity : {} km/sec'.format(v_2))
print('Transfer SMA : {} km Eccentricity : {}'.format(a_t, ecc_t))
print('Transfer Periapsis velocity : {} km/sec'.format(vt_1))
print('Transfer Apoapsis velocity : {} km/sec'.format(vt_2))

print('Delta V1 : {} km/sec'.format(dv_a))
print('Delta V2 : {} km/sec'.format(dv_b))
print('TOF : {} sec = {} day = {} yr'.format(tof, tof/86400, tof/86400/365.25))
print('Phase : {} deg'.format(np.rad2deg(phase_angle)))

# generate a plot of the orbit
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(a_e, 0, 0, 0, 0, 0, 0, mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(a_n, 0, 0, 0, 0, np.pi, np.pi, mu)
_, state_pqw3, _, _, sat_pqw3, _ = kepler.conic_orbit(p_t, ecc_t, 0, 0, 0, 0, np.pi, mu)

fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Earth')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Neptune')
ax.plot(state_pqw3[:, 0], state_pqw3[:, 1], label='Transfer')

ax.set_title('Hohmann Transfer')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.axis('equal')
plt.legend()
plt.show()
