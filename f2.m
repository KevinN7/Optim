function res=f2(x)

global nfev;
res=100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
nfev = nfev + 1;