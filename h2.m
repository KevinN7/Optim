function res = h2(x)

global nhev;
nhev = nhev + 1;
temp = zeros(2,2);
temp(1,1) = 1200*x(1)^2 - 400*x(2) + 2;
temp(1,2) = -400*x(1);
temp(2,1) = -400*x(1);
temp(2,2) = 200;
res = temp;