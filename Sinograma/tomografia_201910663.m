% x = load ('sinograma.dat', '-ascii');
% imagesc(x)
% reconstruction = iradon(x, 180/256, 'linear', 'Ram-Lak');
% figure(2) 
% subplot(1,2,1), imshow(x,[]), title('Imagem original')
% subplot(1,2,2), imshow(reconstruction,[]), title('Imagem reconstruída')