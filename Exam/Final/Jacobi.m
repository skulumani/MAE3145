function err = Jacobi(x,y,C)
global mu

r1=sqrt((x+mu)^2+y^2);
r2=sqrt((x-1+mu)^2+y^2);
err=x^2+y^2+2*(1-mu)/r1+2*mu/r2+2*C;