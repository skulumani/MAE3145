clear all;
close all;

a_vec=[1 3 -2]';
b_vec=[-4 -1 -2]';

dot(a_vec,b_vec)

a=sqrt(dot(a_vec,a_vec));
b=sqrt(dot(b_vec,b_vec));

theta=acos(dot(a_vec,b_vec)/a/b)

c_vec=cross(a_vec,b_vec)

c=norm(c_vec)

a*b*sin(theta)

dot(a_vec,c_vec)