import numpy as np
from astro import kepler, constants

# hyperbolic orbit
rp_h = 6000
ecc_h = 1.2
r_high = 36000

# elliptical orbit
rp = 2000
ra = 6500

re = constants.earth.radius
mu = constants.earth.mu

# TOF for hyperbolic body to go from 36000 km to surface
a_h, p_h = kepler.hyp_per2sma(rp_h, ecc_h)
# true anoamaly at altitude
nu_1 = kepler.nu_solve(p_h, ecc_h, r_high)
nu_1 = np.array(nu_1)
nu_1 = nu_1[nu_1 < 0][0]
# true anomaly at surface
nu_2 = kepler.nu_solve(p_h, ecc_h, re)
nu_2 = np.array(nu_2)
nu_2 = nu_2[nu_2 < 0][0]
# tof between the two
tof_h = kepler.tof_nu(p_h, ecc_h, nu_1, nu_2, mu)

print("TOF of {} sec from {} deg to {} deg".format(tof_h, np.rad2deg(nu_1), np.rad2deg(nu_2)))

# time of flight for elliptical orbit
a_e, p_e, ecc_e = kepler.perapo2aecc(rp, ra)

nu_1 = kepler.nu_solve(p_e, ecc_e, re)
nu_1 = np.array(nu_1)
nu_1 = nu_1[nu_1 > 0][0]

nu_2 = np.deg2rad(180)

tof_e = kepler.tof_nu(p_e, ecc_e, nu_1, nu_2, mu)
print("TOF of {} sec from {} deg to {} deg".format(tof_e[0], np.rad2deg(nu_1), np.rad2deg(nu_2)))

# velocity at intercept

# hyperbolic velocity at missile apogee
sme_h = -mu / 2 / a_h
sme_e = -mu / 2 / a_e

vi_h = np.sqrt(2*(sme_h + mu / ra))
vi_e = np.sqrt(2*(sme_e + mu / ra))

print('Missile velocity = {} km/sec at {} km'.format(vi_e, ra))
print('Body velocity = {} km/sec at {} km'.format(vi_h, ra))
print('Closing velocity = {} km/sec'.format(np.absolute(vi_h - vi_e)))

