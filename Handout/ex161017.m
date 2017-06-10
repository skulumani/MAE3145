%% MAE3145
%% October 17, 2016
%% Plot 3D orbit with orbital elements

clear all;
close all;

r_vec=[-6045 -3490 2500]';
v_vec=[-3.457 6.618 2.533]';

[h,e,theta,Omega,i,omega]=rv2oe(r_vec,v_vec)

theta=linspace(0,2*pi,200);

for k=1:200
    [r_vec_k(:,k), v_vec_k(:,k)]=oe2rv(h,e,theta(k),Omega,i,omega);
end

plot3(r_vec_k(1,:),r_vec_k(2,:),r_vec_k(3,:),'b');
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
view(98,14);

%% plot the initial spacecraft position
hold on;
plot3(r_vec(1),r_vec(2),r_vec(3),'r*');

%% plot the periapsis
mu=398600;
r=norm(r_vec);
h_vec=cross(r_vec,v_vec);
e_vec=1/mu*cross(v_vec,h_vec)-r_vec/r;
e=norm(e_vec);

rp=h^2/mu/(1+e);
rp_vec=rp*e_vec/e;

plot3(rp_vec(1),rp_vec(2),rp_vec(3),'bo');

