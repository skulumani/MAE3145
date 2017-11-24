"""Problem 12 HW6 2017
"""
from astro import kepler, maneuver, constants
import numpy as np

r1 = 8000
r2 = 42160
i1 = np.deg2rad(30)
i2 = 0
mu = constants.earth.mu

# hohmann transfer and combined plane change at apoapsis
at, pt, et = kepler.perapo2aecc(r1, r2)
vt1 = maneuver.vel_mag(r1, at, mu)
vt2 = maneuver.vel_mag(r2, at, mu)
v1 = maneuver.vel_mag(r1, r1, mu)
v2 = maneuver.vel_mag(r2, r2, mu)

dv1, alpha1, beta1 = maneuver.delta_v_solve_planar(v1, vt1, 0, 0)
dv2, beta2, _ = maneuver.delta_v_solve_planar(vt2, v2, i1, 0)
