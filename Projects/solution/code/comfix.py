from astro import tle, constants, kepler, geodetic, time, planets
from collections import defaultdict
import numpy as np
import pdb

def generate_data(tle_file='./data/COMFIX_tle.txt', outfile='./data/COMFIX_tle.txt'):
    # define a time span
    jd_start, _ = time.date2jd(2017, 9, 1, 0, 0, 0)  # time in UTC
    jd_end, _ = time.date2jd(2017, 9, 11, 0, 0, 0)
    jd_step =  1 / (24 * 60)
    jd_span = np.arange(jd_start, jd_end, jd_step)

    # define the observing site
    site_lat = np.deg2rad(38.8999), 
    site_lon = np.deg2rad(-77.0490)
    site_alt = 0.020
    site_ecef = geodetic.lla2ecef(site_lat, site_lon, site_alt)

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
        site_eci = geodetic.eci2ecef(jd).T.dot(site_ecef)

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
    
    # read some TLEs and get the state vector and write to a file
    sats = tle.get_tle(tle_file)

    for sat in sats:
        # propogate for several time periods and get the r, v vectors
        sat.tle_update(jd_span)
        sat.visible_radar(site)



def solution():
    pass
