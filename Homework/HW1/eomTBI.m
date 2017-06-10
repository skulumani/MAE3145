function [X_dot]=eomTBI(t,X)

R1=X(1:3);
V1=X(4:6);
R2=X(7:9);
V2=X(10:12);

G=1;
m1=2;
m2=1;

r=R2-R1;

R1_dot=V1;
V1_dot=G*m2/norm(r)^3*r;
R2_dot=V2;
V2_dot=-G*m1/norm(r)^3*r;

X_dot=[R1_dot; V1_dot; R2_dot; V2_dot];
