"""Problem 3 HW6 2017
"""
import numpy as np
from astro import constants, maneuver, kepler, transform
import matplotlib.pyplot as plt
from kinematics import attitude 
import pdb
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
_, _, rpqw_i, vpqw_i = kepler.coe2rv(p_i, ecc_i, inc_i, raan_i, arg_p_i, nu_i, mu)
fpa_i = kepler.fpa_solve(nu_i, ecc_i)

# convert delta v and alpha into various reference frames
(dv_vnc, dv_lvlh) = maneuver.delta_v_vnc(mag_dv, alpha, 0,fpa_i)
# transform delta v to pqw frame
R_lvlh2pqw = transform.dcm_lvlh2pqw(nu_i)
dv_pqw = R_lvlh2pqw.dot(dv_lvlh)

print('DV : {} V {} C {} N km/sec'.format(dv_vnc[0], dv_vnc[1], dv_vnc[2]))
print('DV : {} R {} T {} H km/sec'.format(dv_lvlh[0],dv_lvlh[1],dv_lvlh[2]))
print('DV : {} P {} Q {} W km/sec'.format(dv_pqw[0],dv_pqw[1],dv_pqw[2]))

# properties of new orbit
rf, vf, fpaf = maneuver.single_impulse(np.linalg.norm(rpqw_i), np.linalg.norm(vpqw_i), fpa_i, mag_dv, alpha)
nu_f = maneuver.nu_solve(rf, vf, fpaf, mu)
print('V2 : {} km/sec'.format(vf))
print('FPAf : {} deg'.format(np.rad2deg(fpaf)))
delta_arg_p = nu_i - nu_f

print('Final orbit after maneuver')
a_f, p_f, ecc_f, nu_f = maneuver.rvfpa2orbit_el(rf, vf, fpaf, mu)
kepler.orbit_el(p_f, ecc_f, inc_i, raan_i, arg_p_i, nu_f, mu, 'True')

# generate a plot of the orbit
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(p_i, ecc_i, 0, 0, 0, nu_i, nu_i, mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(p_f, ecc_f, 0, 0, 0, nu_f, nu_f, mu)

rot_old2new = attitude.rot3(delta_arg_p)
state_pqw2 = rot_old2new.dot(state_pqw2[:, 0:3].T).T
sat_pqw2 = rot_old2new.dot(sat_pqw2[0:3])

# rotate new orbit 
fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Initial')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Final')
ax.plot([0,sat_pqw1[0]], [0,sat_pqw1[1]], 'b.', markersize=10)

ax.set_title('Single Impulse - Maneuver at 90')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.legend()


# travel time to nu = 270
# initial orbit
print('\n\n---------------------MANEUVER AT 270----------------\n')
E_i = np.deg2rad(270)
nu_i = kepler.anom2nu(E_i, ecc_i)
tof = kepler.tof_nu(p_i, ecc_i, np.deg2rad(90), np.deg2rad(270), mu)
print('TOF from 90 to 270 : {} sec = {} hr'.format(tof, tof/3600))

# calculate orbital elements
print('Initial Orbit')
kepler.orbit_el(p_i, ecc_i, inc_i, raan_i, arg_p_i, nu_i, mu, 'True')
_, _, rpqw_i, vpqw_i = kepler.coe2rv(p_i, ecc_i, inc_i, raan_i, arg_p_i, nu_i, mu)
fpa_i = kepler.fpa_solve(nu_i, ecc_i)

# convert delta v and alpha into various reference frames
(dv_vnc, dv_lvlh) = maneuver.delta_v_vnc(mag_dv, alpha, 0,fpa_i)
# transform delta v to pqw frame
R_lvlh2pqw = transform.dcm_lvlh2pqw(nu_i)
dv_pqw = R_lvlh2pqw.dot(dv_lvlh)

print('DV : {} V {} C {} N km/sec'.format(dv_vnc[0], dv_vnc[1], dv_vnc[2]))
print('DV : {} R {} T {} H km/sec'.format(dv_lvlh[0],dv_lvlh[1],dv_lvlh[2]))
print('DV : {} P {} Q {} W km/sec'.format(dv_pqw[0],dv_pqw[1],dv_pqw[2]))

# properties of new orbit
rf, vf, fpaf = maneuver.single_impulse(np.linalg.norm(rpqw_i), np.linalg.norm(vpqw_i), fpa_i, mag_dv, alpha)
nu_f = maneuver.nu_solve(rf, vf, fpaf, mu)
print('V2 : {} km/sec'.format(vf))
print('FPAf : {} deg'.format(np.rad2deg(fpaf)))
delta_arg_p = nu_i - nu_f

print('Final orbit after maneuver')
a_f, p_f, ecc_f, nu_f = maneuver.rvfpa2orbit_el(rf, vf, fpaf, mu)
kepler.orbit_el(p_f, ecc_f, inc_i, raan_i, arg_p_i, nu_f, mu, 'True')

# generate a plot of the orbit
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(p_i, ecc_i, 0, 0, 0, nu_i, nu_i, mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(p_f, ecc_f, 0, 0, 0, nu_f, nu_f, mu)

rot_old2new = attitude.rot3(delta_arg_p)
state_pqw2 = rot_old2new.dot(state_pqw2[:, 0:3].T).T
sat_pqw2 = rot_old2new.dot(sat_pqw2[0:3])

# rotate new orbit 
fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Initial')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Final')
ax.plot([0,sat_pqw1[0]], [0,sat_pqw1[1]], 'b.', markersize=10)

ax.set_title('Single Impulse - Maneuver at 270')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.legend()
plt.show()
