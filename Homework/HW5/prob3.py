"""Script to solve Problem 3 MAE 3145 HW5 2017
"""
from astro import constants, kepler, manuever
import numpy as np
import pdb
import matplotlib.pyplot as plt
from kinematics import attitude
re2km = constants.re2km
mu = constants.earth.mu
deg2rad = constants.deg2rad
rad2deg = constants.rad2deg

# define initial orbit
a1 = 4.5*re2km
ecc1 = .75
p1 = kepler.semilatus_rectum(a1, ecc1)
# final orbit
( a2, p2, ecc2) = kepler.perapo2aecc(2*re2km,6*re2km)
d_arg_p = 35*deg2rad

# solve for true anomaly at intersection of orbits using newton's method

# guess at value of true anomaly - two possible solutions
nu1a = manuever.planar_conic_orbit_intersection(p1, p2, ecc1, ecc2, d_arg_p, np.deg2rad(100))
nu1b = manuever.planar_conic_orbit_intersection(p1, p2, ecc1, ecc2, d_arg_p, np.deg2rad(200))

# conditions of orbit just prior to burn A
print('Initial Orbit prior to BURN A')
kepler.orbit_el(p1, ecc1, 0, 0, 0, nu1a, mu, 'True')
_,_, r1a_pqw, v1a_pqw= kepler.coe2rv(p1, ecc1, 0, 0, 0, nu1a, mu)
fpa1a = kepler.fpa_solve(nu1a, ecc1)
# conditions on final orbit after manuever BURN A
print('Final Orbit after BURN A')
kepler.orbit_el(p2, ecc2, 0, 0, 0, nu1a-d_arg_p, mu, 'True')
_,_, r2a_pqw, v2a_pqw= kepler.coe2rv(p2, ecc2, 0, 0, 0, nu1a-d_arg_p, mu)
fpa2a = kepler.fpa_solve(nu1a-d_arg_p, ecc2)

# COMPUTE BURN A
delta_va, alphaa, betaa = manuever.delta_v_solve_planar(np.linalg.norm(v1a_pqw),
                                                     np.linalg.norm(v2a_pqw),
                                                     fpa1a, fpa2a)
# convert to vnc frame
dva_vnc, dva_lvlh = manuever.delta_v_vnc(delta_va, -alphaa, 0, fpa1a)
print('Delta V: {} km/sec'.format(delta_va))
print('Alpha: {} deg, Beta: {} deg'.format(np.rad2deg(alphaa), np.rad2deg(betaa)))
print('Delta V : {} Vhat {} Chat {} Nhat km/sec'.format(dva_vnc[0], dva_vnc[1], dva_vnc[2]))

# conditions of orbit just prior to burn b 
print('Initial Orbit prior to BURN B')
kepler.orbit_el(p1, ecc1, 0, 0, 0, nu1b, mu, 'True')
_,_, r1b_pqw, v1b_pqw= kepler.coe2rv(p1, ecc1, 0, 0, 0, nu1b, mu)
fpa1b = kepler.fpa_solve(nu1b, ecc1)

# conditions on final orbit after manuever BURN B
print('Final Orbit after BURN B')
kepler.orbit_el(p2, ecc2, 0, 0, 0, nu1b-d_arg_p, mu, 'True')
_,_, r2b_pqw, v2b_pqw= kepler.coe2rv(p2, ecc2, 0, 0, 0, nu1b-d_arg_p, mu)
fpa2b = kepler.fpa_solve(nu1b-d_arg_p, ecc2)


# COMPUTE BURN B
delta_vb, alphab, betab = manuever.delta_v_solve_planar(np.linalg.norm(v1b_pqw),
                                                     np.linalg.norm(v2b_pqw),
                                                     fpa1b, fpa2b)
dvb_vnc, dvb_lvlh = manuever.delta_v_vnc(delta_va, -alphab, 0, fpa1b)
print('Delta V: {} km/sec'.format(delta_vb))
print('Alpha: {} deg, Beta: {} deg'.format(np.rad2deg(alphab), np.rad2deg(betab)))
print('Delta V : {} Vhat {} Chat {} Nhat km/sec'.format(dvb_vnc[0], dvb_vnc[1], dvb_vnc[2]))

# propogate orbit to nu = 250 in final orbit
print('Final orbit at nu=250')
kepler.orbit_el(p2, ecc2, 0, 0, 0, np.deg2rad(250), mu, 'True')
tof = kepler.tof_nu(p2, ecc2, nu1a-d_arg_p, np.deg2rad(250))
print('TOF from {} to {} : {} sec = {} hr'.format(np.rad2deg(nu1a-d_arg_p), 250, tof, tof*1/3600))

# create the plot
# generate a plot of the orbit
_, state_pqw1, _, _, sat_pqw1, _ = kepler.conic_orbit(p1, ecc1, 0, 0, 0, nu1a, nu1a, mu)
_, state_pqw2, _, _, sat_pqw2, _ = kepler.conic_orbit(p2, ecc2, 0, 0, 0, nu1a-d_arg_p,nu1a-d_arg_p, mu)

# rotate the second orbit by the change in argument of perigee
rot_old2new = attitude.rot3(d_arg_p)
state_pqw2 = rot_old2new.dot(state_pqw2[:, 0:3].T).T
sat_pqw2 = rot_old2new.dot(sat_pqw2[0:3])
fig, ax = plt.subplots()

ax.plot(state_pqw1[:, 0], state_pqw1[:, 1], label='Initial')
ax.plot(state_pqw2[:, 0], state_pqw2[:, 1], label='Final')

ax.plot([0, sat_pqw1[0]], [0, sat_pqw1[1]], 'b.-', markersize=10)
ax.set_title('Single Impulse Manuever')
ax.set_xlabel(r'$\hat p$')
ax.set_ylabel(r'$\hat q$')
plt.legend()
plt.show()
