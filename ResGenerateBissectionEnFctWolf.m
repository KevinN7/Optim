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
 for c1 = 0.1:0.1:0.9
     for c2 = (c1 + 0.1):0.1:1
             floor(c1*10)
             floor(c2*10)
             nfev = 0;ngev = 0;nhev = 0;nin = 0;nout = 0;tic;
             [xres,fx,flag] = newtonLocaleBissection(f,g,h,Xflor,epsi,itmax,c1,c2);
             time = toc;
             Res2(floor(c1*10),floor(c2*10)) = (norm((xres - [1;1])))/norm([1;1]);
             if(flag==0)
                 Res(floor(c1*10),floor(c2*10)) = 'lim it';
             else
                 Res(floor(c1*10),floor(c2*10)) = time;
             end;
             %Res(2,cmpt) = (norm((xmin - [1;1])))/norm([1;1]);

     end;
end;

Res
Res2