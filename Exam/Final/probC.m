clear all;
close all;
set(0,'DefaultAxesFontSize',18);
set(0,'DefaultAxesFontName','times');

h=1;
mu=1;

r=linspace(0.4,12,1000);
for k=1:1000
    U(k)=-h^2/2/r(k)^2 +mu/r(k);
end

plot(r,U,'k','LineWidth',1.5);
ylim([-0.1 0.55])
grid on;
xlabel('$$r$$','interpreter','latex');
ylabel('$$U(r)$$','interpreter','latex');

print('probC','-deps2');