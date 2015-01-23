function res = g2(x)

global ngev;
ngev = ngev + 1;

v1 = 2*x(1) -400*x(1)*(-x(1)^2 + x(2)) - 2;
v2 = -200*x(1)^2 + 200*x(2);

res = [v1;v2];