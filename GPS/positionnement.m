function M = positionnement(M0,TGps,TRecep,X,Y,Z,c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcul de la position de l'utilisateur
% function M = positionnement(M0,TGps,TRecep,X,Y,Z,c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrees :
%       M0 : point initial M0 = [X0,Y0,Z0,BH0]' (4x1)
%       TGps : vecteur colonne de taille le nombre de satellites visibles
%               indiquant le temps GPS à l'émission du signal
%       TRecep : vecteur colonne de taille le nombre de satellites visibles
%               indiquant le temps Utilisateur à la réception du signal
%       X : vecteur colonne de taille le nombre de satellites visibles
%               indiquant la coordonnée X des satellites visibles
%       Y : vecteur colonne de taille le nombre de satellites visibles
%               indiquant la coordonnée Y des satellites visibles
%       Z : vecteur colonne de taille le nombre de satellites visibles
%               indiquant la coordonnée Z des satellites visibles
%       c : vitesse de propagation du signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sortie :
%       M : point solution (4x1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fonctions utiles :
%       test_convergence : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisations / recuperation des donnees
CoordSat = [X';Y';Z'];
NbSat = size(CoordSat,2);
Mn=M0;

NbIter = 0;
Critere = 0;

%%%%%%%%%%%%%%%%%%%%%  A COMPLETER %%%%%%%%%%%%%%%%%%%%%%%
% Iterations de Gauss-Newton :
%
%%%%%%%%%%%%%%%%%%%%%  A COMPLETER (fin) %%%%%%%%%%%%%%%%

% Affichage du nombre d'iterations et du critere d'arret ainsi
% que des erreurs sur la position calculee et le biais d'horloge:
%%test_convergence( Mn(1:3), Mn(4), NbIter, Critere );

% Affectation de la solution retournee:
M = Mn;
