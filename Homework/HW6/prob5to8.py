"""COMFIX practice questions from  HW6 2017
"""

from astro import constants, geodetic, time, transform
import numpy as np

# observation
lat, lon, alt = np.deg2rad(77.7), np.deg2rad(-68.5), 0.050
jd = 2454154.6376157
rho, az, el, rhodot, azdot, eldot = 2121.418, np.deg2rad(18.9606), np.deg2rad(35.3507), -3.3204, np.deg2rad(-.07653),  np.deg2rad(.20367)

gst, lst = time.gstlst(jd, lon)
print('JD : {}'.format(jd))
print('GST : {} rad = {} deg'.format(gst, np.rad2deg(gst)))
print('LST : {} rad = {} deg'.format(lst, np.rad2deg(lst)))

# site location
site_ecef = geodetic.lla2ecef(lat, lon, alt)
Recef2eci = transform.dcm_ecef2eci(jd)
site_eci = Recef2eci.dot(site_ecef)
print('Site ECEF : {} km'.format(site_ecef))
print('ECEF TO ECI : \n{}'.format(Recef2eci))
print('Site ECI : {} km'.format(site_eci))

# convert measurement to SEZ then to ECEF then to ECI 
rho_sez, drho_sez = geodetic.rhoazel2sez(rho, az, el, rhodot, azdot,eldot)
R_sez2ecef = transform.dcm_sez2ecef(lat, lon, alt)

# transform satellite vector from SEZ to ECI
rho_ecef = R_sez2ecef.dot(rho_sez)
rho_eci = Recef2eci.dot(rho_ecef)

drho_ecef = R_sez2ecef.dot(drho_sez)
drho_eci = Recef2eci.dot(drho_ecef)

print('\nRHO SEZ : {} km'.format(rho_sez))
print('DRHO SEZ: {} km/sec'.format(drho_sez))

print('SEZ TO ECEF: \n{}'.format(R_sez2ecef))
print('RHO ECEF: {} km/sec'.format(rho_ecef))
print('DRHO ECEF: {} km/sec'.format(drho_ecef))
print('\nRHO ECI: {} km/sec'.format(rho_eci))
print('DRHO ECI: {} km/sec'.format(drho_eci))

# find satellite position and velocity in eci
pos_eci = site_eci + rho_eci
vel_eci = drho_eci + np.cross(np.array([0, 0, constants.earth.omega]), pos_eci)
print('\nSAT POS ECI : {} km'.format(pos_eci))
print('SAT VEL ECI : {} km/sec'.format(vel_eci))
