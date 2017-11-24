"""Bielliptical transfer Problem 10 HW6 2017
"""

from astro import kepler, maneuver, constants 
import numpy as np

r1 = 8000
r2 = 120000
ri = 280000
mu = constants.earth.mu

v1 = maneuver.vel_mag(r1, r1,  mu)
v2 = maneuver.vel_mag(r2, r2, mu)

# bielliptical transfer orbit
ab1, pb1, eccb1 = kepler.perapo2aecc(r1, ri)
ab2, pb2, eccb2 = kepler.perapo2aecc(r2, ri)

# first manuever
vb1 = maneuver.vel_mag(r1, ab1, mu)
dv1 = np.absolute(v1 -vb1)

# second manuever at intermediate radius
vb1i = maneuver.vel_mag(ri, ab1, mu)
vb2i = maneuver.vel_mag(ri, ab2, mu)

dv2 = np.absolute(vb2i - vb1i)

# third maneuver
vb2 = maneuver.vel_mag(r2, ab2, mu)
dv3 = np.absolute(v2 - vb2)

dv_bielliptical = dv1 + dv2 + dv3
tof_bielliptical = np.pi * ( np.sqrt(ab1**3/mu) + np.sqrt(ab2**3/mu))

# hohmann transfer
at, pt, ecct = kepler.perapo2aecc(r1, r2)
vt1 = maneuver.vel_mag(r1, at, mu) 
vt2 = maneuver.vel_mag(r2, at, mu)
dv1, dv2, tof, _ = maneuver.hohmann(r1, r2, 0, 0, 0, np.pi, mu)
