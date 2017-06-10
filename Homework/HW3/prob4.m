clear all;
%close all;

r_vec=[-6634.2 -1261.8 -5230.9];
e_vec=[-0.40907 -0.48751 -0.63640];

e=norm(e_vec)


hhat=cross(r_vec,e_vec)/norm(cross(r_vec,e_vec))
h_vec=hhat;
h=1;


%i=acos(hhat(3));

%e_vec=1/mu*cross(v_vec,h_vec)-r_vec/r;
%e=norm(e_vec)

zhat=[0; 0; 1];
N_vec=cross(zhat,h_vec)

i=acos(dot(h_vec,zhat)/h)

Omega=atan2(N_vec(2),N_vec(1))

omega=atan2(dot(h_vec,cross(N_vec,e_vec)),h*dot(N_vec,e_vec))

theta=atan2(dot(h_vec,cross(e_vec,r_vec)),h*dot(e_vec,r_vec))
