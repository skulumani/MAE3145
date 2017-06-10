clear all;
close all;

r_vec=[-6045 -3490 2500]';
v_vec=[-3.457 6.618 2.533]';

[h,e,theta,Omega,i,omega,e_vec,rp]=rv2oe(r_vec,v_vec)

%[r_vec,v_vec]=oe2rv(h,e,theta,Omega,i,omega)
 
theta=linspace(0,2*pi,200);
for k=1:200
    [r_vec_k(:,k) v_vec_k(:,k)]=oe2rv(h,e,theta(k),Omega,i,omega);
end

plot3(r_vec_k(1,:),r_vec_k(2,:),r_vec_k(3,:));
axis equal;
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');

hold on;
plot3(r_vec(1),r_vec(2),r_vec(3),'r*');

rp_vec=rp*e_vec/norm(e_vec);
plot3(rp_vec(1),rp_vec(2),rp_vec(3),'bo');
