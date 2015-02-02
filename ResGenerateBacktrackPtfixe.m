global nfev;
global ngev;
global nhev;
global nin;
global nout;

%INIT

%Paramere probleme
f = 'f2';g = 'g2';h = 'h2';

%Parametre recherche lineaire
rho = 0.5;  %contraction backtracking
c1 =0.5;  %wolf1
c2 =0.7;  %wolf2
s0 = 0.5; %interpolation

%Critere Arret
itmax = 10^6;
epsi = 10^-6;


Xflor = [3;1];
cmpt = 1;
 for flor = 0.1:0.1:1
    nfev = 0;ngev = 0;nhev = 0;nin = 0;nout = 0;tic;
    [xmin,fx,flag] = newtonLocaleBacktrack(f,g,h,Xflor,epsi,itmax,flor,0.1);
    time = toc;
    Res(1,cmpt) = time;
    Res(2,cmpt) = nfev;
    Res(3,cmpt) = ngev;
    Res(4,cmpt) = nhev;
    Res(5,cmpt) = nin;
    Res(6,cmpt) = nout;
    cmpt = cmpt+1;
end;

Res