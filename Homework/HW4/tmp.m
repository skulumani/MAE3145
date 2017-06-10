rA=8000;
rB=linspace(rA*10,rA*60,500);
rC=104000;

deltaVH=Hohmann(rA,rC);

for i=1:500
    deltaVB=BEHohmann(rA,rB(i),rC);
    Vratio(i)=deltaVB/deltaVH;
    rratio(i)=rB(i)/rA;
end

plot(rratio,Vratio)

