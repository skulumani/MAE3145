"""Problem 11 HW6 2017
"""
from astro import kepler, maneuver, constants
import numpy as np
import matplotlib.pyplot as plt
r1 = 10000
r2 = 42160
mu = constants.earth.mu

et = 0.75
pt = 15000
at = pt / (1 - et**2)
rp = at * (1 - et)
ra = at * (1 + et)

v1 = maneuver.vel_mag(r1, r1, mu)
v2 = maneuver.vel_mag(r2, r2, mu)

# solve for first manuever
nu1 = kepler.nu_solve(pt, et, r1)
vt1 = maneuver.vel_mag(r1, at, mu)
rt1 = r1
fpa1 = kepler.fpa_solve(nu1[0], et)

dv1, alpha1, beta1  = maneuver.delta_v_solve_planar(v1, vt1, 0, fpa1)

# solve for second manuever
nu2 = kepler.nu_solve(pt, et, r2)
vt2 = maneuver.vel_mag(r2, at, mu)
rt2 = r2
fpa2 = kepler.fpa_solve(nu2[0], et)

dv2, alpha2, beta2  = maneuver.delta_v_solve_planar(vt2, v2, fpa2, 0)

# time of flight
tof = kepler.tof_nu(pt, et, nu1[0], nu2[0], mu)

# add plot
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(r1, 0, 0, 0, 0, 0, 0, mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(r2, 0, 0, 0, 0, 0, 0, mu)
_, state_pqwt, _, _, sat_pqwt1, _ = kepler.conic_orbit(pt, et, 0, 0, 0, nu1[0], nu2[0], mu)
_, _, _, _, sat_pqwt2, _ = kepler.conic_orbit(pt, et, 0, 0, 0, nu2[0], nu2[0], mu)

# rotate new orbit 
fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Initial')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Final')
ax.plot(state_pqwt[:, 0], state_pqwt[:, 1], label='Transfer')

ax.plot([0,sat_pqwt1[0]], [0,sat_pqwt1[1]], 'b.', markersize=10)
ax.plot([0,sat_pqwt2[0]], [0,sat_pqwt2[1]], 'b.', markersize=10)

ax.set_title('Two single impulse maneuvers')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.legend()
plt.axis('equal')
plt.show()

