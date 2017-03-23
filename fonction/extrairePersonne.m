function [X image] = extraireImage(matrice,index)

% Cette fonction consiste a extraire une personne de la matrice X
% de taille n (images) et m (pixels). Apr�s avoir extrait les 10 images on
% doit les garder dans une matrice B. 

% Les donn�es d'entr�e sont :
%   matrice - La matrice X initiale (complete)
%   index - L'index de la personne qu'ont veut extraire

% Les donn�es de sorties sont :
%   X - La matrice X sans l'index "index" (l'image concern�)
%   image - L'image extraite pr�te a �tre affich� 
% ----------------------------------------------------------------------

% On r�cup�re l'image 
% Pour mon cas les images sont en colonne dans X
% il suffit d'inverser l'index
    n=(10*(index-1))+1;
    image = matrice(:,n:(n+9));
% On enleve l'image r�cup�r� de la matrice X
% -------On pourrait mettre X en tant que parametre d'entr�e et encore X en
% tant que param�tre de sortie ce qui nous fait �crire une ligne en moins.
    matrice(:,n:(n+9))=[];
    X=matrice;
% reconstuire une image a partir d'un vecteur qu'on pourrait afficher
% Cette �tape est juste pr�sente pour le test
% image_real est l'image qu'on peut afficher
% image est la colonne de l'image

% image_real=reshape(image,[92 112]);
% % l'Image apparait pivot� de -90�, ce qui m'a amen� a afficher la transpos�
% imshow(image_real');

% Exemple d'utilisation
% [X1 image]= extraireImage(X,3); -- Cette ci extrait l'image a l'index 3
% [X2 images] = extraireImage(X,[4,11,21,34,41]) -- Cette ci extrait les
%   images d'index (4,11,21,34,41)


end
