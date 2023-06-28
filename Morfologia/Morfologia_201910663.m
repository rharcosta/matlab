% imagem = imread('BASE_MORFOLOGIA.bmp');
% se1 = strel('line', 11,90);
% se2 = strel('line', 50,180);
% 
% erodedBW1 = imerode(imagem, se1);
% erodedBW2 = imerode(imagem, se2);
% 
% dilatedBW1 = imdilate(erodedBW1,se1);
% dilatedBW2 = imdilate(erodedBW2,se2);
% imagem2 = imagem - dilatedBW1 - dilatedBW2;
% 
% subplot(2,2,1), imshow(imagem,[]), title('Imagem original')
% subplot(2,2,2), imshow(dilatedBW1,[]), title('Linhas verticais')
% subplot(2,2,3), imshow(dilatedBW2,[]), title('Linhas horizontais')
% subplot(2,2,4), imshow(imagem2,[]), title('Linhas inclinadas')
