function [mpi] = disco(tamanho, raio, clinha, ccoluna)
% imagesc(mpi)
% mudar a cor da imagem: colormap(gray)
% msi(disco(256, 64);
% truesize
mpi = zeros(tamanho);

% encontrar o centro da imagem
% clinha = tamanho/2+0.5;
% ccoluna = tamanho/2+0.5;

for linha = 1:tamanho
    for coluna = 1:tamanho
        if sqrt((linha-clinha)^2+(coluna-ccoluna)^2) <= raio
            mpi(linha,coluna) = 255;
        else
        end
    end
end

end

