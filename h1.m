function res = h1(x)

global nhev;
nhev = nhev + 1;

temp = zeros(2,2);
temp(1,1) = 6;
temp(1,2) = 2;
temp(2,1) = 2;
temp(2,2) = 6;
res = temp;