%%% Edward Shannon
%%% Orbital Mechanics
%%% Homework #3

%% Problem 3
% Part C
clear all;
close all;
clc
%% 
h=4.2426e+04;
e=0.8351;
theta=linspace(0,2*pi,200);
Omega=0.7854;
omega=2.9301;
i=1.5708;
 
for k=1:200
    [r_vec_theta(:,k),v_vec_theta(:,k)]=oe2rv(h,e,theta(k),Omega,omega,i);
end

grid on
axis equal 
plot3(r_vec_theta(1,:),r_vec_theta(2,:),r_vec_theta(3,:))
figure;

