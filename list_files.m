

function L = list_files(path)
% lecture des noms de fichiers dans un r�pertoire retour en cell array
	
	%%
	%% Example:
	%% 	L = list_files("./data/yalefaces")
	L = dir(path); % fonction Matlab : retour d'un 3x1 struct array (n elems) with fields:
                    % name date bytes isdir datenum
                    % taille n = nb fichiers et r�pertoires
	L = L(3:length(L)); % element 1 ='.' �l�ment2='..' on commence au 3�me
	L = struct2cell(L); % conversion en cell array
	L = L(1,:); % on ne retient que les noms (attention : consid�r�s ensuite comme seuls r�pertoires
end
