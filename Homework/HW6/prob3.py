% script to solve AAE532_PS8_Prob4

% load constants
clear all
clc
close all

constants = aae532_constants;
mu = constants.earth.mu;
re2km = constants.re2km;
deg2rad = constants.deg2rad;
rad2deg = constants.rad2deg;

% initial orbit
ecc_i = .4;
a_i = 6*re2km;
nu_i = 90*deg2rad;

p_i = a_i*(1-ecc_i^2);
inc_i = 0;
raan_i = 0;
arg_p_i = 0;

mag_dv = .75;
alpha = -60*deg2rad;

% calculate orbital elements
[a h period sme fpa_i r_per r_apo r_ijk v_ijk ...
    r_pqw v_pqw r_lvlh v_lvlh r v v_circ v_esc...
    E M n] = elp_orbit_el(p_i,ecc_i,inc_i,raan_i,arg_p_i,nu_i,mu);

% convert delta v and alpha into various reference frames
[dv_vnc dv_lvlh] = delta_v_frame(mag_dv,alpha, 0,fpa_i)
