function [fm] = rampa2d_201910663(tam)
%fm - frequência (saída) de modulação
%função butterworth2d com as entradas de tamanho, ordem e frequência de corte
%frequência de corte é uma referência (máximo de 0.6), se o que estiver dentro da série de
%fourier ele pega, caso ao contrário não

fm = zeros(tam); %matriz quadrada de zeros de tamanho tam

%percorrendo a matriz
for linha = 1:tam
    for coluna = 1:tam
        w = sqrt((linha-(tam/2+1))^2+(coluna-(tam/2+1))^2)/tam; %unidade de 1/pixel
        fm(linha, coluna) = w/0.5;            %calculo da função
    end
end

%figure(1), imagesc(fm), truesize %mostrar função de modulação
%joga tudo na mesma imagem
subplot(1,2,1), imagesc(fm)  %1 linha e duas colunas, 1 imagem: circulo(imagem)
x = (cumsum(ones(256, 1)) - 129)/256;
subplot(1,2,2), plot(x,fm(tam/2,:)) %2 imagem: gráfico(gráfico)
%figure(2), plot(x, fm9tam/2,:))

end

%terminal:
%saida = butter2d_201910663(256, 3, 0.25);
%truesize - um pixel da tela igual a um pixel da imagem (centraliza a
%imagem na matriz)
% x = (cumsum(ones(256, 1)) - 129)/256;
% figure(2), plot(x, saida(128,:))- pegar a linha 128
% saida = butter2d_201910663(256, 15, 0.25);
% figure(2), plot(x, saida(128,:))



