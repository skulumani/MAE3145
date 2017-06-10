clear all;
close all;

r_vec=[-6045 -3490 2500];
v_vec=[-3.457 6.618 2.533];

[h,e,theta,Omega,i,omega]=rv2oe(r_vec,v_vec)

theta=linspace(0,2*pi,500);
for k=1:500
    [r_vec_theta(:,k), v_vec_theta(:,k)]=oe2rv(h,e,theta(k),Omega,i,omega);
end

plot3(r_vec_theta(1,:),r_vec_theta(2,:),r_vec_theta(3,:));
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
view(96,16);

hold on;
plot3(r_vec(1),r_vec(2),r_vec(3),'r*');

mu=398600;
r=norm(r_vec);
h_vec=cross(r_vec,v_vec);
h=norm(h_vec);
e_vec=1/mu*cross(v_vec,h_vec)-r_vec/r;
e=norm(e);
rp=h^2/mu/(1+e);
rp_vec=rp*e_vec/e;

plot3(rp_vec(1),rp_vec(2),rp_vec(3),'ro');