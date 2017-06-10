function [h,e,theta,Omega,i,omega,e_vec,rp]=rv2oe(r_vec,v_vec)
%% MAE3145
%% October 17, 2016
%% Convert (r,v) into orbital elements

r=norm(r_vec);

h_vec=cross(r_vec,v_vec);
h=norm(h_vec);

mu=398600;
e_vec=1/mu*cross(v_vec,h_vec)-r_vec/r;
e=norm(e_vec);

x_hat=[1 0 0]';
y_hat=[0 1 0]';
z_hat=[0 0 1]';

N_vec=cross(z_hat,h_vec);

i=acos(dot(h_vec,z_hat)/h);

Omega=atan2(dot(y_hat,N_vec),dot(x_hat,N_vec));
omega=atan2(dot(h_vec,cross(N_vec,e_vec)),h*dot(N_vec,e_vec));
theta=atan2(dot(h_vec,cross(e_vec,r_vec)),h*dot(e_vec,r_vec));

rp=h^2/mu/(1+e);


