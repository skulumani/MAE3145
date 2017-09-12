import numpy as np
from astro import eoms, constants

rearth2moon = np.array([0, constants.moon.orbit_sma, 0])
rearth2sun = np.array([-constants.earth.orbit_sma, 0, 0])
rmoon2sun = -rearth2moon + rearth2sun

m_moon = constants.moon.mass
m_earth = constants.earth.mass
m_sun = constants.sun.mass

dominant_accel = - constants.G * (m_earth + m_moon) / np.linalg.norm(rearth2moon)**3 * rearth2moon
direct_accel = constants.G * m_sun * rmoon2sun / np.linalg.norm(rmoon2sun)**3
indirect_accel = constants.G * m_sun * rearth2sun/np.linalg.norm(rearth2sun)**3

print("Dominant accel: {} km/sec^2".format(dominant_accel))
print("Direct accel: {} km/sec^2".format(direct_accel))
print("Indirect accel: {} km/sec^2".format(indirect_accel))
