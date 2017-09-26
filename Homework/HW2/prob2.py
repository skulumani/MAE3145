"""
Purpose: 
- Solve AAE532 PS 3 Problem 2

Inputs: 
- List all inputs into function

Outpus: 
- List/describe outputs of function

Dependencies: 
- aae532_constants.m

Author: 
- Shankar Kulumani 8 Sept 2012
- list revisions
- Shankar Kulumani 26 Sept 2017
    - for MAE3145

References
- AAE532_PS3.pdf  
- MAE3145 HW2 2017
"""
from astro import constants
import numpy as np

re = constants.earth.radius
mu_earth = constants.earth.mu
m_sc = 500
G = constants.G
m_earth = constants.earth.mass

mu_tot = G*(m_earth+m_sc)
rad2deg = 180/np.pi

alt = 2000

r = np.array([alt+re, 0, 0])
v = np.array([-1.2, 6.7, 0])

# reduced mass
red_mass = (m_earth+m_sc)/(m_earth*m_sc)

# angular momentum
sys_ang_mom = 1/red_mass*np.cross(r,v)
spec_ang_mom = red_mass*sys_ang_mom
print('C3 : {} km^2 kg / sec'.format(sys_ang_mom))
print('h : {} km^2/sec'.format(spec_ang_mom))

# mechanical energy
T = .5*1/red_mass*(np.dot(v,v))
U = G*m_earth*m_sc/np.linalg.norm(r)

sys_mech_eng = T-U

spec_mech_eng = red_mass*sys_mech_eng

print('T : {} km^2/kg /sec'.format(T))
print('C4 : {} km^2 kg /sec^2'.format(sys_mech_eng))
print('energy : {} km^2 / sec^2'.format(spec_mech_eng))

# areal velocity

area_vel = np.linalg.norm(spec_ang_mom)/2
print('Areal velocity : {} km^2/sec'.format(area_vel))
# orbital elements

p = np.linalg.norm(spec_ang_mom)**2/mu_tot
ecc = np.sqrt(1+2*spec_mech_eng*np.linalg.norm(spec_ang_mom)**2/mu_tot**2)
a = p/(1-ecc**2)
per = 2*np.pi*np.sqrt(a**3/mu_tot)

nu = np.arccos(1/ecc*(p/np.linalg.norm(r)-1))*rad2deg
nu = 360 - nu
v_circ = np.sqrt(mu_earth/(alt+re))

print('p : {} km'.format(p))
print('ecc : {} '.format(ecc))
print('a : {} km'.format(a))
print('periapsis : {} km'.format(per))
print('nu : {} deg'.format(nu))
print('v_circ : {} km/sec'.format(v_circ))

# perifocal frame
r_pqw = np.linalg.norm(r) * np.array([np.cos(np.deg2rad(nu)), np.sin(np.deg2rad(nu)), 0])
print('PQW pos : {} km'.format(r_pqw))
