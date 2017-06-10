function EM_Jacobi
global mu mu1 mu2 r12 W

W=2.66538e-6;
mu1=398620;
mu2=4903.02;
mu=mu1+mu2;
r12=3.844e5;


L1=[3.217e5 0 0];
L2=[4.444e5 0 0];
L3=[-3.863e5 0 0];
L4=[r12/2-mu2/mu*r12,sqrt(3)/2*r12,0];

Jacobi(L1)
Jacobi(L2)
Jacobi(L3)
Jacobi(L4)

end

function C=Jacobi(L)
global mu mu1 mu2 r12 W 

pi1=mu1/mu;
pi2=mu2/mu;

x1=-pi2*r12;
x2=pi1*r12;

x=L(1);
y=L(2);


r1=sqrt((x-x1)^2+y^2);
r2=sqrt((x-x2)^2+y^2);

C=-1/2*W^2*(x^2+y^2)-mu1/r1-mu2/r2;

end