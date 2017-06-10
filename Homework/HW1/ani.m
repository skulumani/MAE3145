%clear all;
close all;
load prob1;

a=figure('units','normalized','position',[0.1 0.1 0.8 0.8],'Color','w');hold on;

[sph.x sph.y sph.z]=sphere(50);
rad=0.05;
sph.x=sph.x*rad;
sph.y=sph.y*rad;
sph.z=sph.z*rad;

k=1;
hm1=surf(R1(k,1)+sph.x*1.4,R1(k,2)+sph.y*1.4,R1(k,3)+sph.z*1.4,'FaceColor',[1 0 0],'Linestyle','none');
hm2=surf(R2(k,1)+sph.x,R2(k,2)+sph.y,R2(k,3)+sph.z,'FaceColor',[0 0 1],'Linestyle','none');
hlm1=line(R1(1:k,1),R1(1:k,2),R1(1:k,3),'Color',[1 0 0]);
hlm2=line(R2(1:k,1),R2(1:k,2),R2(1:k,3),'Color',[0 0 1]);
hlG=line(RG(1:k,1),RG(1:k,2),RG(1:k,3),'Color',[0 0 0]);

set(gca,'DataAspectRatioMode','manual');
light;
axis equal;
axis([-1 5 -1 5 -1 5]);
set(gca,'Visible','off');

pause(1);
%return;

for k=floor(linspace(1,max(size(t)),200))
    drawnow;
    set(hm1,'XData',R1(k,1)+sph.x*1.4,'YData',R1(k,2)+sph.y*1.4,'ZData',R1(k,3)+sph.z*1.4);
    set(hm2,'XData',R2(k,1)+sph.x,'YData',R2(k,2)+sph.y,'ZData',R2(k,3)+sph.z);
    set(hlm1,'XData',R1(1:k,1),'YData',R1(1:k,2),'ZData',R1(1:k,3));
    set(hlm2,'XData',R2(1:k,1),'YData',R2(1:k,2),'ZData',R2(1:k,3));
    set(hlG,'XData',RG(1:k,1),'YData',RG(1:k,2),'ZData',RG(1:k,3));
    
end
