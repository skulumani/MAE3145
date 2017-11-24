"""Problem 9 HW6 2017
"""
from astro import maneuver, kepler, constants
import numpy as np

ra = 25000
rb = 40000
rc = 10000
rd = 55000

mu = constants.earth.mu
# orbit 1 properties 
a1, p1, ecc1 = kepler.perapo2aecc(ra, rb)
va1 = maneuver.vel_mag(ra, a1, mu)
vb1 = maneuver.vel_mag(rb, a1, mu)

# orbit 2 properties
a2, p2, ecc2 = kepler.perapo2aecc(rc, rd)
vc2 = maneuver.vel_mag(rc, a2, mu)
vd2 = maneuver.vel_mag(rd, a2, mu)

# A to C Hohmann trasnfer
at1, pt1, ecct1 = kepler.perapo2aecc(rc, ra)
vat = maneuver.vel_mag(ra, at1, mu)
vct = maneuver.vel_mag(rc, at1, mu)

dv1, dv2, tof1, _ = maneuver.hohmann(ra, rc, ecc1, ecc2, 0, 0, mu)
dvt1 = np.absolute(dv1) + np.absolute(dv2)

# B to D Hohmann trasnfer
at2, pt2, ecct2 = kepler.perapo2aecc(rb, rd)
vbt = maneuver.vel_mag(rb, at2, mu)
vdt = maneuver.vel_mag(rd, at2, mu)

dv1, dv2, tof2, _ = maneuver.hohmann(rb, rd, ecc1, ecc2, np.pi, np.pi, mu)
dvt2 = np.absolute(dv1) + np.absolute(dv2)
