clear all;
close all;

r=1000:500:100000;

for i=1:length(r)
    [F(i) U(i)]=gravFU(r(i));
end

plot(r,F);
xlabel('r');
ylabel('F');

figure;
plot(r,U);
xlabel('r');
ylabel('U');
