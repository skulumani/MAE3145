"""Script to run Predict
"""
from __future__ import absolute_import, division, print_function, unicode_literals

from collections import defaultdict
import numpy as np
from astro import geodetic, time, planets, tle, constants, transform
from kinematics import attitude
import os
import pdb
import datetime

deg2rad = np.pi / 180
rad2deg = 180 / np.pi

mu = constants.earth.mu
re = constants.earth.radius
eesqrd = constants.earth.eesqrd
ee = constants.earth.ee

# TODO : Generate solution for a known TLE. Also output some extra data like in tle_predict test_case.out
def generate_solution(ifile='./data/example_tle.txt', ofile='./data/SAT_OUT_EXAMPLE.txt'):
    ifile = os.path.abspath(ifile)
    ofile = os.path.abspath(ofile)

    site_lat = np.deg2rad(float(input("Site Latitude (38.925) : ") or "38.925"))
    site_lon = np.deg2rad(float(input("Site Longitude (-77.057) : ") or "-77.057"))
    site_alt = float(input("Site Altitude (0.054) : ") or "0.054")

    site_ecef = geodetic.lla2ecef(site_lat, site_lon, site_alt)
    
    # timespan
    date_start = [float(i) for i in (input('Start Date UTC (2017 12 1 0 0 0) : ') or "2017 12 1 0 0 0").split()]
    date_end = [float(i) for i in (input('End Date UTC (2017 12 5 0 0 0) : ') or "2017 12 5 0 0 0").split()]

    jd_start, _ = time.date2jd(date_start[0], date_start[1], date_start[2], date_start[3],
                               date_start[4], date_start[5])
    jd_end, _ = time.date2jd(date_end[0], date_end[1], date_end[2], date_end[3],
                               date_end[4], date_end[5])

    jd_step = 2 / (24 * 60) # step size in minutes
    jd_span = np.arange(jd_start, jd_end, jd_step)
    
    # echo check some data
    with open(ofile, 'w') as f:
        f.write('PREDICT EXAMPLE RESULTS : Shankar Kulumani\n\n')
        f.write('Check Input Data : \n\n')
        f.write('Site Latitude    = {:9.6f} rad = {:9.6f} deg\n'.format(site_lat, np.rad2deg(site_lat)))
        f.write('Site Longitude   = {:9.6f} rad = {:9.6f} deg\n'.format(site_lon, np.rad2deg(site_lon)))
        f.write('Site Altitude    = {:9.6f} km  = {:9.6f} m\n'.format(site_alt, site_alt * 1000))
        
        f.write('\nObservation Window :\n\n')
        f.write('Start Date : {} UTC\n'.format(datetime.datetime(int(date_start[0]), int(date_start[1]), int(date_start[2]), int(date_start[3]), int(date_start[4]), int(date_start[5])).isoformat()))
        f.write('End Date   : {} UTC\n\n'.format(datetime.datetime(int(date_end[0]),int(date_end[1]),int(date_end[2]),int(date_end[3]),int(date_end[4]),int(date_end[5])).isoformat()))
        
        f.write('Start Julian Date   = {}\n'.format(jd_start))
        f.write('End Julian Date     = {}\n\n'.format(jd_end))

    # loop over jd span
    site = defaultdict(list)
    site['lat'] = site_lat
    site['lon'] = site_lon
    site['alt'] = site_alt
    site['ecef'] = site_ecef

    for jd in jd_span:
        gst, lst = time.gstlst(jd, site_lon)
        # site_eci = geodetic.site2eci(site_lat, site_alt, lst)
        # site_eci = attitude.rot3(gst).dot(site_ecef)
        site_eci = transform.dcm_ecef2eci(jd).dot(site_ecef)

        # test if site is in the dark
        sun_eci, _, _ = planets.sun_earth_eci(jd)

        # append site information to list
        site['eci'].append(site_eci)
        site['sun_eci'].append(sun_eci)
        site['gst'].append(gst)
        site['lst'].append(lst)
    
    with open(ofile, 'a') as f:
        f.write('Site Data:\n\n')
        f.write('Start GST : {:9.6f} rad\n'.format(site['gst'][0]))
        f.write('Start LST : {:9.4f} rad\n'.format(site['lst'][0]))
        f.write('Site ECEF : {:9.6f} x {:9.6f} y {:9.6f} z km\n'.format(site['ecef'][0], site['ecef'][1], site['ecef'][2]))
        f.write('Sun ECI_0 : {:9.6f} x {:9.6f} y {:9.6f} z km\n\n'.format(site['sun_eci'][0][0], site['sun_eci'][0][1], site['sun_eci'][0][2]))
        f.write('{}\n\n'.format('*'*80)) 

    # turn into numpy arrays
    for key, item in site.items():
        site[key] = np.squeeze(np.array(item))

    # update the downloaded TLEs if necessary
    # now we have to read the TLE
    sats = tle.get_tle(ifile)

    # now propogate and the check if each satellite is visible
    for sat in sats:
        sat.tle_update(jd_span)
        sat.visible(site)
        sat.output(ofile)


if __name__ == "__main__":
    pass
    # parse inputs

    # option to generate extra solution for students

    # option to download spacetrack tle and then run predict

    # option to use saved tle
def update_tle():
    # get latest TLE for ISS
    tle.get_tle_spacetrack(ifile, 'testing')
