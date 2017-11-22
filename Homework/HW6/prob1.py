"""HW6 2017 Problem 1
"""

% load constants
constants = aae532_constants;

mu = constants.sun.mu;
a_e = constants.earth.orbit_sma;
a_n = constants.neptune.orbit_sma;
km2au = constants.km2au;

ecc_e = 0;
ecc_n = 0;

% circular earth velocity
v_1 = sqrt(mu/a_e);
v_2 = sqrt(mu/a_n);
% transfer orbit
a_t = .5*(a_e+a_n);
ecc_t = a_n/a_t-1;

% velocity of transfer orbit at initial and final orbit
sme_t = -mu/(2*a_t);
vt_1 = sqrt(2*(sme_t+mu/a_e));
vt_2 = sqrt(2*(sme_t+mu/a_n));

[dv_a,dv_b,tof , phase_angle] = hohmann (a_e,a_n,ecc_e,ecc_n,0,pi,mu);
