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


Xflo(:,1) = [0;0];
Xflo(:,2) = [10;10];
Xflo(:,3) = [0;1];
Xflo(:,4) = [1;0];
Xflo(:,5) = [1;3];
Xflo(:,6) = [3;1];

for k=1:6
nfev = 0;ngev = 0;nhev = 0;nin = 0;nout = 0;tic;
%H0 = feval(h,Xflo(:,k));

%[xmin,fx,flag] = quasiNewton(f,g,H0,Xflo(:,k),epsi,itmax);
[xmin,fx,flag] = newtonLocale(f,g,h,Xflo(:,k),epsi,itmax);
time = toc;
(norm((xmin - [1;1])))/norm([1;1])
%xmin

Res(k,:) = [k time flag nfev ngev nhev];
 
end;

Res
