function res = f1(x)

global nfev
res = 2*(x(1) + x(2) -2)^2+(x(1) - x(2))^2;
nfev = nfev + 1;