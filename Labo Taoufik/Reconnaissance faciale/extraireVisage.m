function image = extraireVisage(link,w,h )

%   Mettre l'image en noir et blanc
    img = rgb2gray(imread(link));
    imshow(img);
%   on d�clare l'objet magique qui est inclu dans matlab pour d�tecter les
%   visages
    faceDetector = vision.CascadeObjectDetector;
%   Les bboxes contiennent les coordonn�es qui vont nous servir pour le d�coupage du visage
    bboxes = step(faceDetector, img);
    
% %   D�couper le visage si il existe, sinon renvoyer un message d'echec


    if ~isempty(bboxes)
        
        
        marge=10;
        
        x=bboxes(1)-marge;
        y=bboxes(2)-marge;
        largeur=bboxes(3)+marge;
        hauteur=bboxes(4)+marge;
        
        if(x <0) x=0; end
        if(y <0) y=0; end
        [n m]=size(img);
        if(y+hauteur>n) hauteur=n; end
        if(x+largeur>m) largeur=m; end
        disp([x y largeur hauteur marge]);
        visage=img(y:y+hauteur,x:x+largeur);

        % Un second test provisoire pour �tre sure que la variable < visage >
        % contient bien un visage
%         if ~isempty(step(faceDetector, visage))
%             
%             imwrite(imresize(visage,[120,120]),strcat('images/created/',int2str(Num+1),'.jpg'));
%             disp(strcat('images/created/',int2str(Num+1),'.jpg', ' a �t� cr�e'));
%             % on fixe une taille de 120x120 pixels pour tous nos images pour
%             % �viter d'avoir des probl�mes de taille quand il s'agit de constituer le X
%             % qui va �tre trait� pour faire de la reconnaissance facile.
%         end
    else
        disp('Aucun visage n a �t� trouv� dans limage donn�e. Essayer avec une autre image');
    end
%   Adapter le visage aux mesures donn�es : w (pour width) et h pour (height)
    image = imresize(visage,[h w]);
%   Renvoyer le visage    
    imshow(image);
%     Juste pour �tre sure que le imresize a bien fait son boulot
    disp(size(image))

    
end



