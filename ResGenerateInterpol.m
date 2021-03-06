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
itmax = 10^4;
epsi = 10^-6;


Xflor = [3;1];
cmpt = 1;
G = [0.1:0.01:0.9];
 for c1 = G
            c1
             nfev = 0;ngev = 0;nhev = 0;nin = 0;nout = 0;tic;
             [x,fx,flag] = newtonLocaleInterpol(f,g,h,Xflor,epsi,itmax,c1,1);
             time = toc;
             Res(2,cmpt) = flag;
             Res(1,cmpt) = time;
             Res(3,cmpt) = (norm((x - [1;1])))/norm([1;1]);
             Res(4,cmpt) = nin;
             Res(5,cmpt) = nout;
             cmpt = cmpt+1;
end;

Res
size(G)
size(Res)
plot(G,Res(1,:));
figure;
plot(G,Res(3,:));
% figure;
% plot(G,Res(4,:),G,Res(5,:));
% hleg1 = legend('it interne','it externe');