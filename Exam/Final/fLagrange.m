function error=fLagrange(x,flag)
global mu

if flag == 3
    error=x+(1-mu)/(x+mu)^2+mu/(x-1+mu)^2;
elseif flag == 1
    error=x-(1-mu)/(x+mu)^2+mu/(x-1+mu)^2;
elseif flag == 2
    error=x-(1-mu)/(x+mu)^2-mu/(x-1+mu)^2;
end