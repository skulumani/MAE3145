"""Problem 3 HW6 2017
"""
import numpy as np
from astro import constants, manuever, kepler

mu = constants.earth.mu
re2km = constants.re2km
deg2rad = constants.deg2rad
rad2deg = constants.rad2deg

# initial orbit
ecc_i = .4 
a_i = 6*re2km 
nu_i = 90*deg2rad 

p_i = kepler.semilatus_rectum(a_i, ecc_i)
inc_i = 0 
raan_i = 0 
arg_p_i = 0 

mag_dv = 0.75
alpha = -60*deg2rad

# calculate orbital elements
print('Initial Orbit')
kepler.orbit_el(p_i, ecc_i, inc_i, raan_i, arg_p_i, nu_i, mu, 'True')

# convert delta v and alpha into various reference frames
(dv_vnc, dv_lvlh) = delta_v_frame(mag_dv, alpha, 0,fpa_i)

# transform delta v to pqw frame

# properties of new orbit

# get rv then add dv

# draw a plot
