close all;
clear all;

r_vec=[20 15 0]';
v_vec=[-6 0 0]';

r=norm(r_vec)
v=norm(v_vec)

mu=400

E=1/2*v^2-mu/r

h_vec=cross(r_vec,v_vec)

h=norm(h_vec)

e=sqrt(2*E*h^2/mu^2+1)

rP=h^2/mu/(1+e)

e_vec=1/mu*cross(v_vec,h_vec)-r_vec/r

rP_vec=rP*e_vec/e