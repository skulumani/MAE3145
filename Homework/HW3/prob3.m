clear all;
close all;

r_vec=[6000 6000 6000]';
v_vec=[-5 -5 0]';

mu=398600;

% r=norm(r_vec);
% 
% h_vec=cross(r_vec,v_vec);
% h=norm(h_vec)
% 
% e_vec=1/mu*cross(v_vec,h_vec)-r_vec/r;
% e=norm(e_vec)
% 
% zhat=[0; 0; 1];
% N_vec=cross(zhat,h_vec);
% 
% i=acos(dot(h_vec,zhat)/h)
% 
% Omega=atan2(N_vec(2),N_vec(1))
% 
% omega=atan2(dot(h_vec,cross(N_vec,e_vec)),h*dot(N_vec,e_vec))
% 
% theta=atan2(dot(h_vec,cross(e_vec,r_vec)),h*dot(e_vec,r_vec))
% 
% disp([h,e,theta,Omega,omega,i]);
[h,e,theta,Omega,omega,i]=rv2oe(r_vec,v_vec)


theta=linspace(0,2*pi,200);
for k=1:200
     [r_vec_theta(:,k),v_vec_theta(:,k)]=oe2rv(h,e,theta(k),Omega,omega,i);
end
plot3(r_vec_theta(1,:),r_vec_theta(2,:),r_vec_theta(3,:));
xlabel('x');ylabel('y');zlabel('z');
grid on;
axis equal;
hold on;
plot3(r_vec(1),r_vec(2),r_vec(3),'r*');

figure;
plot3(v_vec_theta(1,:),v_vec_theta(2,:),v_vec_theta(3,:));
xlabel('x');ylabel('y');zlabel('z');
hold on;
plot3(v_vec(1),v_vec(2),v_vec(3),'r*');
grid on;
axis equal;

%figure(1);print('prob3r','-depsc2');
%figure(2);print('prob3v','-depsc2');