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
    # define the observing site
    site_lat = 38.925 * deg2rad
    site_lon = -77.057 * deg2rad
    site_alt = 0.054
    site_ecef = geodetic.lla2ecef(site_lat, site_lon, site_alt)

    # timespan
    jd_start, _ = time.date2jd(2017, 12, 1,  0, 0, 0)  # time in UTC
    jd_end, _ = time.date2jd(2017, 12, 5, 0, 0, 0)
    jd_step = 0.25 / (24 * 60)
    jd_span = np.arange(jd_start, jd_end, jd_step)

    ifile = os.path.abspath('ALL_TLE.txt')
    ofile = os.path.abspath('SAT_OUT.txt')

    # get latest TLE for ISS
    tle.get_tle_spacetrack(ifile, 'testing')

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

# TODO : Run predict without any extra help
def generate_solution(ifile='./data/ALL_TLE.txt', ofile='./data/SAT_OUT.txt'):
    ifile = os.path.abspath(ifile)
    ofile = os.path.abspath(ofile)

    site_lat = float(raw_input("Site Latitude (38.925) : ") or "38.925")
    site_lon = float(raw_input("Site Longitude (-77.057) : ") or "-77.057")
    site_alt = float(raw_input("Site Altitude (0.054) : ") or "0.054")

    site_ecef = geodetic.lla2ecef(site_lat, site_lon, site_alt)
    
    # timespan
    jd_start, _ = time.date2jd(2017, 12, 1,  0, 0, 0)  # time in UTC
    jd_end, _ = time.date2jd(2017, 12, 5, 0, 0, 0)
    jd_step = 0.25 / (24 * 60)
    jd_span = np.arange(jd_start, jd_end, jd_step)

    # get latest TLE for ISS
    # tle.get_tle_spacetrack(ifile, 'testing')

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
