"""Script to run Predict
"""
from __future__ import absolute_import, division, print_function, unicode_literals

from collections import defaultdict
import numpy as np
from astro import geodetic, time, planets, tle, constants, transform
from kinematics import attitude
import os
import pdb

deg2rad = np.pi / 180
rad2deg = 180 / np.pi

mu = constants.earth.mu
re = constants.earth.radius
eesqrd = constants.earth.eesqrd
ee = constants.earth.ee

# TODO : Generate solution for a known TLE. Also output some extra data like in tle_predict test_case.out
def generate_example_solution():
    ifile = os.path.abspath(ifile)
    ofile = os.path.abspath(ofile)

    site_lat = np.deg2rad(38.925)
    site_lon = np.deg2rad(-77.057)
    site_alt = 0.054

    site_ecef = geodetic.lla2ecef(site_lat, site_lon, site_alt)
    
    # timespan
    date_start = [2017, 12, 1, 0, 0, 0]
    date_end = [2017, 12, 5, 0, 0, 0]

    jd_start, _ = time.date2jd(date_start[0], date_start[1], date_start[2], date_start[3],
                               date_start[4], date_start[5])
    jd_end, _ = time.date2jd(date_end[0], date_end[1], date_end[2], date_end[3],
                               date_end[4], date_end[5])

    jd_step = 2 / (24 * 60) # step size in minutes
    jd_span = np.arange(jd_start, jd_end, jd_step)

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

def update_tle():
    # get latest TLE for ISS
    tle.get_tle_spacetrack(ifile, 'testing')
