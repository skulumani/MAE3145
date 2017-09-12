import numpy as np
from astro import constants, eoms

G = constants.G
msc = 130 # kilograms

Gmsc = G * msc 
Gtotal = constants.earth.mu + constants.sun.mu + constants.jupiter.mu + constants.moon.mu + Gmsc

# define the position of each body ( in x hat direction) from the sun
rearth = np.array([constants.earth.orbit_sma, 0, 0])
rsun = np.zeros(3)
rmoon = rearth + np.array([constants.moon.orbit_sma, 0, 0])
rjupiter = np.array([constants.jupiter.orbit_sma, 0, 0])
rsc = rmoon + np.array([150000, 0, 0])

# compute the center of mass
rcom = 1 / Gtotal * ( constants.earth.mu * rearth + constants.sun.mu * rsun + constants.moon.mu * rmoon + constants.jupiter.mu * rjupiter + Gmsc * rsc)

print("COM WRT SUN: {} xhat km = {} sun radii xhat km".format(rcom[0], rcom[0] / 
                                                              constants.sun.radius))

# now compute the acceleration on the spacecraft using our fancy gravity force function

accel_sun = eoms.gravity_force(constants.sun.mass, msc, rsc) / msc 
accel_earth = eoms.gravity_force(constants.earth.mass, msc, rsc - rearth) / msc
accel_moon = eoms.gravity_force(constants.moon.mass, msc, rsc - rmoon) / msc
accel_jupiter = eoms.gravity_force(constants.jupiter.mass, msc, rsc - rjupiter) / msc

net_accel = accel_sun + accel_earth + accel_moon + accel_jupiter

print("Sun accel: {} km/sec^2 xhat".format(accel_sun[0]))
print("Earth accel: {} km/sec^2 xhat".format(accel_earth[0]))
print("Moon accel: {} km/sec^2 xhat".format(accel_moon[0]))
print("Jupiter accel: {} km/sec^2 xhat".format(accel_jupiter[0]))
print("Net accel: {} km/sec^2 xhat".format(net_accel[0]))
