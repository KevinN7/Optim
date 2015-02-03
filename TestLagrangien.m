fprintf('LAGRANGIEN AUGMENTE :\n');
fprintf('\n')
fprintf('Standart :\n');

f = 'f2';
c = @(x1,x2) (x1^2) + (x2^2) - 1.5;
tau = 0.5;
mu0 = 1;
x0 = [1;1];
lambda0 = [1;1];
epsi0 = 10^-6;
itmax = 400;

tic;
[xmin,fmin,flag] = langrangien(f,c,tau,mu0,x0,lambda0,epsi0,itmax);
time = toc;
fprintf('Temps:%f\n',time);
xmin
fmin
%fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
%fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);