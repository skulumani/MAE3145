clear all;
close all;
global mu
mu=0.01;
load zerorel;

figure('color','w');

Lx0=[1-(mu/3)^(1/3),1+(mu/3)^(1/3),-1-((sqrt(2)-1)/3)*mu];
for k=1:3
    Lx(k)=fsolve(@(x) fLagrange(x,k),Lx0(k),optimset('Display','off'));
end
Lx(4)=0.5-mu;
Lx(5)=0.5-mu;

C1=Jacobi(Lx(1),0,0);
C2=Jacobi(Lx(2),0,0);
C3=Jacobi(Lx(3),0,0);
C5=Jacobi(Lx(4),sqrt(3)/2,0);



[c,h]=contour(x,y,-Z,-[C5:0.005:C3 C3:0.04:C2 C2:0.04:C1 C1:0.04:3.6]);hold on;
xlabel('$$x$$','Interpreter','Latex','FontSize',10);
ylabel('$$y$$','Interpreter','Latex','FontSize',10);
axis equal;

plot(Lx(1:3),[0 0 0],'k.',Lx(4:5),[sqrt(3)/2 -sqrt(3)/2],'k.','MarkerSize',10);hold on;
plot(-mu,0,'k.','MarkerSize',20);
plot(1-mu,0,'k.','MarkerSize',15);

set(gca,'FontSize',10,'Visible','off');

for ii=[1 2 3 5]
    eval(['C=C' num2str(ii)]);
    figure('color','w');
    [c,h]=contour(x,y,-Z,-C,'LineColor','k');hold on;
    plot(Lx(1:3),[0 0 0],'k.',Lx(4:5),[sqrt(3)/2 -sqrt(3)/2],'k.','MarkerSize',10);hold on;
    plot(-mu,0,'k.','MarkerSize',20);
    plot(1-mu,0,'k.','MarkerSize',15);
    xlabel('$$x$$','Interpreter','Latex','FontSize',10);
    ylabel('$$y$$','Interpreter','Latex','FontSize',10);
    axis equal;
    set(gca,'FontSize',10,'Visible','off');
    print(['R3BP_curves_' num2str(ii)],'-depsc2');
end


%print('JC','-depsc2');