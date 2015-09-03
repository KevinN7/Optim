%***********************************************************************
% Code initial :                                                       *
% Fichier            C14.m                                             *
%                    nov 2004                                          *
%                    J. Gergaud                                        *
%                    INP Toulouse - ENSEEIHT                           *
% Derniere version : Novembre 2013                                     *
%***********************************************************************
%
% ======================================================================
% Ce programme estime les paramètres dans le problème d'estimation 
% des paramètres pour le problème de la datation par le carbonne 14
% Programme MATLAB
% Le modèle est:
% A(t)=A0exp(-lambda t)
% On cherche p=(A0,lambda) de façon à ce que le modèle 
% approche le mieux les données au sens des moindres carrés.
% Les programmes et algorithmes utilisés pour la minimisation sont:
% Newton, Gauss-Newton
% =======================================================================
%
clear all; close all; format short
% Initialisation
%
% Donnees:
global Ti Ai
Ti=[500 1000 2000 3000 4000 5000 6300]
Ai=[14.5 13.5 12.0 10.8 9.9 8.9 8.0]

% Fig 1 et 2 : points a interpoler

% Pour l'algorithme de Newton
figure(1)                          
plot(Ti,Ai,'o')
rect=[0 7000 0 18];
axis(rect)
xlabel('t')
ylabel('A(t)')
hold on

% Pour l'algorithme de Gauss-Newton
figure(2)                          
plot(Ti,Ai,'o')
axis(rect)
xlabel('t')
ylabel('A(t)')
hold on

% Fig 3 : Visualisation 3D de f
xmin=9;
xmax=20;
nx=100;
pasx=(xmax-xmin)/nx;
ymin=0;
ymax=0.0003;
ny=100;
pasy=(ymax-ymin)/ny;

x=xmin:pasx:xmax;
y=ymin:pasy:ymax;
[X,Y]=meshgrid(x,y);
[m,n]=size(X);
for i=1:m,
   for j=1:n,
      Z(i,j)=f_C14([X(i,j),Y(i,j)]);
   end;
end;
figure(3)
mesh(X,Y,Z)
xlabel('A_0');
ylabel('\lambda')
zlabel('f(A_0,\lambda)')

% Figs 4 et 5 : Visualisation 2D de f (courbes de niveaux)

% Figure a utiliser pour l'algorithme de Newton
figure(4)                             
contour(X,Y,Z,50);
xlabel('A_0')
ylabel('\lambda')
hold on
% Figure a utiliser pour l'algorithme de Gauss-Newton
figure(5)                            
contour(X,Y,Z,50);
xlabel('A_0')
ylabel('\lambda')
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Partie a completer : Ajout des iterations des algorithmes
%		       de Newton et Gauss-Newton


% Point de départ
 p0=[10 0.0001]'   
% Newton
% ------
p=p0;
% On trace la courbe
T=0:10:6300;
A=p(1)*exp(-p(2)*T);
figure(1)
plot(T,A)
figure(4)
text(p(1),p(2),'o point de d\''epart','interpreter','latex')
%
% COMPLETER AVEC 5 ITERATIONS DE NEWTON (tracer les points)
%
% Gauss-Newton
% ------------
p=p0;
% On trace la courbe
T=0:10:6300;
A=p(1)*exp(-p(2)*T);
figure(2)
hold on
plot(T,A)
figure(5)
text(p(1),p(2),'o point de d\''epart','interpreter','latex')
%
% COMPLETER AVEC 5 ITERATIONS DE GAUSS-NEWTON (tracer les points)
