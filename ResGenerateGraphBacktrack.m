global nfev;
global ngev;
global nhev;
global nin;
global nout;

%INIT

%Paramere probleme
f = 'f2';g = 'g2';h = 'h2';

%Parametre recherche lineaire
rho = 0.85;  %contraction backtracking
c1 =0.1;  %wolf1
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
G = [0.01:0.01:0.99]
H0 = feval(h,Xflo(:,6));
    cmpt = 1;
    for c1 = G
        nfev = 0;ngev = 0;nhev = 0;nin = 0;nout = 0;tic;
        %[xmin,fx,flag] = newtonLocaleBacktrack(f,g,h,Xflo(:,k),epsi,itmax,X,0.1);
        [xmin,fx,flag] = quasiNewtonBacktrack(f,g,Xflo(:,6),H0,epsi,itmax,c1,rho);
        time = toc;
        Res(1,cmpt) = (norm((xmin - [1;1])))/norm([1;1]);
        Res(2,cmpt) = time;
        cmpt = cmpt+1;
    end;

Res;
figure;
plot(G,Res(1,:));
figure;
plot(G,Res(2,:));