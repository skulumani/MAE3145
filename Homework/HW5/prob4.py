"""Script to solve HW5 Problem 4 2017
"""
from astro import kepler, constants, manuever, transform
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
# load constants
r_mars = constants.mars.radius
mu = constants.mars.mu
deg2rad = constants.deg2rad
rad2deg = constants.rad2deg

# initial orbit elements
a = 5*r_mars
ecc =.5
p = kepler.semilatus_rectum(a, ecc)
inc = 30*deg2rad
raan = 45*deg2rad
arg_p = -60*deg2rad
nu = 120*deg2rad

print('Initial Mars Orbit')
kepler.orbit_el(p,ecc,inc,raan,arg_p,nu,mu,'True')
r_inertial, v_inertial, _, _ = kepler.coe2rv(p, ecc, inc, raan, arg_p, nu, mu)
fpa = kepler.fpa_solve(nu, ecc)
# delta v in inertial coordinates
dv_inertial = np.array([0.1,-0.25,0.2])

# form rotation matrix to go from mars inertial frame to LVLH frame
dcm_mci2pqw = transform.dcm_eci2pqw_coe(raan, inc, arg_p)
dcm_pqw2lvlh = transform.dcm_pqw2lvlh(nu)

dv_lvlh = dcm_pqw2lvlh.dot(dcm_mci2pqw).dot(dv_inertial)
print('Delta V : {} rhat {} that {} hhat km/sec'.format(dv_lvlh[0], dv_lvlh[1], dv_lvlh[2]))
mag_dv = np.linalg.norm(dv_lvlh)

mag_dv_outofplane = dv_lvlh[2]
mag_dv_inplane = np.linalg.norm(dv_lvlh[0:1])
print('Percentage out of plane : {} %'.format(mag_dv_outofplane / mag_dv * 100))
print('Delta V inplane magnitude : {} km/sec'.format(mag_dv_inplane))

beta = np.arctan2(mag_dv_outofplane, mag_dv_inplane)
phi = np.arctan2(dv_lvlh[0], dv_lvlh[1])
alpha = phi-np.absolute(fpa)

print('Beta (out of plane) : {} deg'.format(np.rad2deg(beta)))
print('Phi (angle from theta_hat) : {} deg'.format(np.rad2deg(phi)))
print('Alpha (angle from Vhat) : {} deg'.format(np.rad2deg(alpha)))

r_initial = r_inertial
v_initial = v_inertial

r_final = r_initial
v_final = dv_inertial+v_initial

# find orbital elements of new orbit
( p_n,a_n,ecc_n,inc_n,raan_n,arg_p_n,nu_n,_,_,_,_) = kepler.rv2coe(r_final,v_final, mu)

print('Final Orbit')
kepler.orbit_el(p_n,ecc_n,inc_n,raan_n,arg_p_n,nu_n,mu,'True')

# generate a plot of the orbit
state_mci1, state_pqw1, _, sat_mci1, _, _ = kepler.conic_orbit(p, ecc, inc, raan, arg_p, nu, nu, mu)
state_mci2, state_pqw2, _, sat_mci2,_, _ = kepler.conic_orbit(p_n, ecc_n, inc_n, raan_n, arg_p_n, nu_n, nu_n, mu)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.plot(state_mci1[:, 0],state_mci1[:, 1], state_mci1[:, 2], label='Initial')
ax.plot(state_mci2[:, 0],state_mci2[:, 1], state_mci2[:, 2], label='Final')
ax.plot([0, sat_mci1[0]], [0, sat_mci1[1]], [0, sat_mci1[2]], 'b.-', markersize=10)
ax.scatter(0, 0, 0,s=1000)
ax.set_title('Single Impulse Manuever')
ax.set_xlabel(r'$\hat x$')
ax.set_ylabel(r'$\hat y$')
ax.set_zlabel(r'$\hat z$')
plt.legend()
plt.show()
