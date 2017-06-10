function [F,U]=gravFU(r)

M=5.9742e24;
G=6.674e-11;
m=1;

F=G*M*m/r^2;
U=-G*M*m/r;
