clear all;
close all;

syms a b c d x1 x2 x3

q=[cos(a)*cos(b) cos(a)*sin(b) sin(a)].'

qd=expmso3([x1 x2 x3])*q;


A=(q.'*qd)*eye(3)-q*qd.';
