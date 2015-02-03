global nfev;
global ngev;
global nhev;
global nin;
global nout;

%INIT

%Paramere probleme
f = 'f2';g = 'g2';h = 'h2';
%x0 = [0;0];
x0 = [10;10];
%x0 = [0;1];
%x0 = [1;0];
%x0 = [1;3];
%x0 = [3;1];
H0 = eye(2);

%Parametre recherche lineaire
rho = 0.5;  %contraction backtracking
c1 =0.5;  %wolf1
c2 =0.7;  %wolf2
s0 = 0.5; %interpolation

%Critere Arret
itmax = 10^6;
epsi = 10^-6;

fprintf('FMINUNC:\n');
tic;
[xmin,fmin,exitflag,output] = fminunc(f,x0);
time = toc;
fprintf('Temps:%f\n',time);
xmin
fmin
%exitflag
output
traiterFlag(exitflag);

flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,1) = [ time; flor];


fprintf('NEWTON LOCALE :\n');
fprintf('\n')
fprintf('Standart :\n');
nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;
tic;
[xmin,fx,flag] = newtonLocale(f,g,h,x0,epsi,itmax);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,2) = [ time; flor];

fprintf('\n')
fprintf('Backtracking :\n');
nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;

tic;
[xmin,fx,flag] = newtonLocaleBacktrack(f,g,h,x0,epsi,itmax,rho,c1);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,3) = [ time; flor];


fprintf('\n')
fprintf('Bissection :\n');
nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;

tic;
[xmin,fx,flag] = newtonLocaleBissection(f,g,h,x0,epsi,itmax,c1,c2);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,4) = [ time; flor];



fprintf('\n')
fprintf('Interpolation :\n');

nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;
tic;
[xmin,fx,flag] = newtonLocaleInterpol(f,g,h,x0,epsi,itmax,c1,s0);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,5) = [ time; flor];



fprintf('\n')
fprintf('Approche-Finition :\n');

nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;
tic;
[xmin,fx,flag] = newtonLocaleApprocheFinition(f,g,h,x0,epsi,itmax,c1,c2);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,5) = [ time; flor];




fprintf('QUASI NEWTON :\n');
fprintf('\n');





fprintf('Standart :\n');
nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;
H0 = feval(h,x0);
tic;
[xmin,fx,flag] = quasiNewton(f,g,H0,x0,epsi,itmax);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,6) = [ time; flor];


fprintf('\n')
fprintf('Backtracking :\n');

nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;
tic;
[xmin,fx,flag] = quasiNewtonBacktrack(f,g,x0,H0,epsi,itmax,c1,rho);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,7) = [ time; flor];


fprintf('\n')
fprintf('Bissection :\n');

nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;
tic;
[xmin,fx,flag] = quasiNewtonBissection(f,g,x0,H0,epsi,itmax,c1,c2);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,8) = [ time; flor];


fprintf('\n')
fprintf('Interpolation :\n');

nfev = 0;
ngev = 0;
nhev = 0;
nin = 0;
nout = 0;
tic;
[xmin,fx,flag] = quasiNewtonInterpol(f,g,x0,H0,epsi,itmax,c1,s0);
time = toc;
fprintf('Temps:%f\n',time);
fprintf('Iteration externe:%d  Iteration interne:%d  \n',nout,nin);
fprintf('Appel fct:%d  Appel grad:%d  Appel Hessien:%d  \n',nfev,ngev,nhev);
traiterFlag(flag)
flor = (norm((xmin - [1;1])))/norm([1;1]);
RES(:,8) = [ time; flor];



% fprintf('\n')
% fprintf('FMINUNC :\n');
% 
% tic;
% options = optimoptions('fminunc','GradObj','on','Algorithm','quasi-newton');
% F(:,1) = @(x)f(x)
% F(:,2) = @(x)g(x)
% [xmin,fx] = fminunc(F,x0,options);
% time = toc;
% fprintf('Temps:%f\n',time);
% traiterFlag(flag)


RES
