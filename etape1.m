cd '//qlsrv/vg502574/Bureau/Projet tut/TD3/projet'

% lecture de la base de visages
% X=matrice de donn�es 1 colonne = 1 visage = 1 image r�arrang�e en vecteur

[X y width height names] = lire_base('//qlsrv/vg502574/Bureau/Projet tut/att_face');
% pour un visage
n1=height; %nb pixels hauteur
n2=width; %nb pixels largeur
n=width*height; %nb pixels image = nb individus
nvar=size(X,2); %nb images = nb variable


g=mean(X);
ecart=std(X);
Y=X-ones(n,1)*g; % matrice des donn�es centr�es
Y=Y*diag(1./ecart); % donn�es centr�es r�duites
Yt=Y';
V=(1/n)*Yt*Y; % matrice des variances-covariances
[U,vp1]=eig(V); % diagonalisation de V
vp=diag(vp1);
[vpo,I]=sort(vp,'descend'); % valeurs propres ordonn�es 
P(:,:)=U(:,I(:)); % permutation vecteurs propres selon ordre
Intot=sum(vpo); % inertie totale
taux=vp/Intot; 
tauxO=vpo/Intot; % part d'inertie pour axes principaux

% calcul de la part d'inertie cummul�e 
tmp=0;
for (i=1:size(tauxO,1))
    tmp=tmp+tauxO(i);
    cum(i)=tmp;
end

%---------------------------------------------------------
% matrice des facteurs principaux
% colonne D(:,j) = j�me facteur principal
diago=diag(1./sqrt(vpo));
D=Y*P*diago;
%---------------------------------------------------------


nb1=4;
nb2=10;
titre=cell(2,1,nb1*nb2);
close all
gallerieBIS(D,n1,n2,nb1,nb2,titre);

F=Y'*D;
F=F/n;

G=F';
H=G(:,1); % visage 1 complet (tous les coefs sur base faces propres)
MH=repmat(H,1,40); %40 copies du visage

for (j=1:39)
    MH(j*10+1:end,j)=0;
end

R=D*MH; % (reconstitution des images � partir coefs sur faces propres 

% tableau de cellules pour les titres des graphiques
% calcul des cos2
titre=cell(2,1,40);
no2=norm(R(:,40),2)^2;
for (j=1:40)
    no=norm(R(:,j),2)^2;
    ti={['dim', num2str(10*j),' : ',num2str(100*cum(10*j),'%.1f'),'%'];['cos2 : ',num2str(100*no/no2,'%.1f'),'%']};
    titre(:,:,j)=ti;
end

close all
gallerieBIS(R,n1,n2,4,10,titre);
