% No terminal: P1_201910663_COMP("nome_do_arquivo");

function[bimestral] = P1_201910663_COMP(estomago)

% Carregar arquivo
estomago = dicomread(estomago);

% Obter tamanho do arquivo
tam = size(estomago);
% ans =
% 
%           64          64           1        3060
% 64 linhas; 64 colunas; 1 imagem preta e branca; 3060 imagens

% Somar imagens
img = sum(estomago(:,:,1,:),4);

% Normalizar o valor do pixel de 0 a 255
imagemNormalizada = uint8(255*mat2gray(img));
%imagesc(imagemNormalizada)

% Binarizar imagem
bw = imbinarize(imagemNormalizada, 0.1);
%imagesc(bw)

% Criar matriz de zeros
nsinal = zeros(tam(1), tam(2), 3);

 % Percorrendo a matriz i = linha; j = coluna
 % Linha
 for i = 1 : tam(1)
     % Coluna
     for j = 1 : tam(2)
         % Visualizando se o pixel analizado na linha e coluna é um
         % estômago, ou seja, pixel = 1
         if(bw(i, j) > 0)
             % Armazenando o ponto onde o pixel = 1, onde há um estômago
             sinal = estomago(i, j, 1, :);
             % Transformada de Fourrier
             f = fft(sinal-mean(sinal));
             % Encontrando a maior frequência
             % Declarando a posição inicial das variáveis max e posição
             max = 0;
             posicao = 0;
             
             % Varredura de todos os frames de um certo pixel 
             for k = 2 : tam(4)
                valorABS = abs(f(:,:,:,k));
                    % Conferindo se o valor absoluto é maior que a variável
                    % max = 0
                    if (valorABS > max)
                        % Variável max recebe o valor absoluto
                        max = valorABS;
                        % Recebendo posição de maior frequência
                        posicao = k;
                    end
             end
             % Recebe a fase do pixel
             fase = angle(f(posicao));
             % Dividindo o estômago entre fases (movimentações) e colorindo cada uma
             
             % Se a fase for maior que -pi e menor que -pi/3
             if fase  > (-pi) && fase < ((-pi)/3)
               % Colorir a imagem de vermelho(1)
               nsinal(i, j, 1) = estomago(i, j, 1, posicao);
               
             % Se a fase for maior que -pi/3 e menor que pi/3
             elseif fase  > ((-pi)/3) && fase < ((pi)/3)
               % Colorir a imagem de verde(2)
               nsinal(i, j, 2) = estomago(i, j, 1, posicao);
               
             % Se a fase for maior que pi/3 e menor que pi
             elseif fase  > ((pi)/3) && fase < (pi)
               % Colorir a imagem de azul(3)
               nsinal(i, j, 3) = estomago(i, j, 1, posicao);
             end
          end
     end
 end
 % Função bimetral vai receber a imagem com as fases definidas e coloridas
 bimestral = nsinal;
 % Exibindo imagem
 imagesc(bimestral), truesize;
end
