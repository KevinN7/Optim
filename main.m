disp('Projet\n');

fct=input('fonction:','s');


%Parametres
epsi = 0.00001;
x0 = [-30;30];
itmax =  300;


disp('Newton Locale');

sol=newtonLocale(fct,x0,epsi,itmax);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('QuasiNewton');

H0 = hessien(i,x0);
xmin = quasiNewton(i,x0,H0,epsi,itmax);
xmin
