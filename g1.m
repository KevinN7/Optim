function res = g1(x)

global ngev;
ngev = ngev + 1;

v1 = 6*x(1)+2*x(2)-8;
v2 = 2*x(1)+6*x(2)-8;

res = [v1;v2];