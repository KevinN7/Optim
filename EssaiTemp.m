global nfev;
global ngev;
global nhev;
global nin;
global nout;

%INIT

%Paramere probleme
f = 'f1';g = 'g1';h = 'h1';
x0 = [10;10];
H0 = eye(2);

%Parametre recherche lineaire
rho = 0.5;  %contraction backtracking
c1 =0.5;  %wolf1
c2 =0.7;  %wolf2
s0 = 0.5; %interpolation

%Critere Arret
itmax = 10^6;
epsi = 10^-6;

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
xmin