% Carregar imagem: rosas = imread('ROSAS.bmp', 'bmp');
% Mostrar imagem: imshow(rosas)
% Saber sobre a imagem: whos rosas
% figure
% >> subplot(2,2,1); imshow(rosas); title('Imagem colorida')
% >> subplot(2,2,2); imshow(rosas(:,:,1)); title('Componentes de vermelho - R')
% >> subplot(2,2,3); imshow(rosas(:,:,2)); title('Componentes de verde - G')
% >> subplot(2,2,4); imshow(rosas(:,:,3)); title('Componentes de azul - B')
% 
% Ver o n鷐ero das cores: 
% rosas(150, 53,:)
%   1󪻓 uint8 array
% 
% ans(:,:,1) =
% 
%    176
% 
% 
% ans(:,:,2) =
% 
%    3
% 
% 
% ans(:,:,3) =
% 
%    0
% 
% https://www.cin.ufpe.br/~cabm/visao/Aula03_ImagemMatLab.pdf
% https://wiki.sj.ifsc.edu.br/index.php/Curso_Matlab_aplicado_ao_processamento_de_imagens_-_Aula_3
% Abertura e fechamento de imagens: 
% >> teste = ones(64);
% >> teste(31: 34, 31:34) = zeros(4);
% >> figure(2), imagesc(teste)
% >> colormap(gray)
% >> teste(:, 65: 128) = 1 - teste;
% >> figure(2), imagesc(teste)
% >> teste_fechamento = imerode(imdilate(teste, ones(5)), ones(5));
% >> figure(2), imagesc(teste_fechamento)
% 
