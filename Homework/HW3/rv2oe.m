function [h,e,theta,Omega,omega,i]=rv2oe(r_vec,v_vec)
mu=398600;

r=norm(r_vec);
h_vec=cross(r_vec,v_vec);
h=norm(h_vec);

e_vec=1/mu*cross(v_vec,h_vec)-r_vec/r;
e=norm(e_vec);

zhat=[0 0 1];
N_vec=cross(zhat,h_vec);

i=acos(dot(h_vec,zhat)/h);

xhat=[1 0 0];
yhat=[0 1 0];
Omega=atan2(dot(yhat,N_vec),dot(xhat,N_vec));

omega=atan2(dot(h_vec,cross(N_vec,e_vec)),h*dot(N_vec,e_vec));

theta=atan2(dot(h_vec,cross(e_vec,r_vec)),h*dot(e_vec,r_vec));
