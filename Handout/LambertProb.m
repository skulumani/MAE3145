function [vA_vec vB_vec a e h]=LambertProb(rA_vec,rB_vec,tAB,mu)

myoption=optimset('MaxFunEvals',10000,'display','off');
a=fsolve(@(a) LambertEqn(a,rA_vec,rB_vec,tAB,mu),100000,myoption);

c=norm(rB_vec-rA_vec);
rA=norm(rA_vec);
rB=norm(rB_vec);

s=1/2*(rA+rB+c);
alpha=2*asin(sqrt(s/2/a));
beta=2*asin(sqrt((s-c)/2/a));

X=sqrt(mu/4/a)*cot(alpha/2);
Y=sqrt(mu/4/a)*cot(beta/2);

urAhat=rA_vec/rA;
urBhat=rB_vec/rB;
uchat=(rB_vec-rA_vec)/c;

vA_vec=(X+Y)*uchat+(Y-X)*urAhat;
vB_vec=(X+Y)*uchat-(Y-X)*urBhat;

h_vec=cross([rA_vec 0],[vA_vec 0]);
e_vec=1/mu*cross([vA_vec 0],h_vec)-[rA_vec 0]/rA;

h=norm(h_vec);
e=norm(e_vec);


function error=LambertEqn(a,rA_vec,rB_vec,tAB,mu)
a=real(a);

c=norm(rB_vec-rA_vec);
rA=norm(rA_vec);
rB=norm(rB_vec);

s=1/2*(rA+rB+c);
alpha=2*asin(sqrt(s/2/a));
beta=2*asin(sqrt((s-c)/2/a));

error=norm(sqrt(mu)*tAB-a^(3/2)*(alpha-beta-sin(alpha)+sin(beta)));