clear all;
close all;


rA=8000;
rC=104000;

rB=linspace(rA*10,rA*60,500);
delVH=3.7785
for k=1:500
    
    [delVBE(k)]=BEH_Vicky(rA,rB(k),rC)
    [delVBE_L(k)]=BEHohmann(rA,rB(k),rC)
end

plot(rB/rA,delVBE/delVH);

figure;
plot(rB/rA,delVBE_L/delVH);