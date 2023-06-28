% Segmentação Imagem
% 
% >> imagem = imread('AMAZONIA_PARA_ANALISE_SEM_NOMENCLATURAS.PNG');
% >> imshow(imagem)
% >> i = rgb2gray(imagem);
% >> threshold = graythresh(i);
% >> bw = im2bw(i, threshold);
% >> imagesc(bw)
% >> sum(sum(bw))
% 
% ans =
% 
%       121330
% 
% >> sum(sum(bw))*.47
% 
% ans =
% 
%    5.7025e+04
% str = string(sum(sum(bw))*.47);
% title('Tamanho da área desmatada em km quadrados: ' +str);