clear all;
close all;

E=[1 100 0 0 10];
h=[1e5 1e5 7e4 8e4 8e4];

mu=398600;
RE=6378;

for i=1:5
    roots([2*E(i) 2*mu -h(i)^2]);
    rp(i)=max(roots([2*E(i) 2*mu -h(i)^2]));
    
    
    if RE > rp(i)
        v(i)=sqrt(2*E(i)+2*mu/RE);
    else
        v(i)=sqrt(2*E(i)+2*mu/rp(i));
    end
    
end


