clear all;

x=0:0.01:5;

for i=1:length(x)
    y(i)=sin(x(i));
end

plot(x,y,'r');
xlabel('x');
ylabel('y');
title('my sine');
