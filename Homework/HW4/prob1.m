clear all;
close all;
set(0,'DefaultAxesFontSize',18);
set(0,'DefaultAxesFontName','times');


rA=8000
rC=8000*13
rB=8000*20

[delV_H delT_H]=Hohmann(rA,rC)
[delV_B delT_B]=BEHohmann(rA,rB,rC)


rB=linspace(rA*10,rA*60,500);

for k=1:500
    delV_B(:,k)=BEHohmann(rA,rB(k),rC);
end

plot(rB/rA,delV_B(1,:)/delV_H);
xlabel('$$r_B/r_A$$','interpreter','latex');
ylabel('$$\Delta V_B/ \Delta V_H $$','interpreter','latex');
%set(gca,'XTick',[],'YTick',[])

hold on;
plot(48.99,1,'r*')

figure;

plot(rB/rA,delT_B/delT_H);
