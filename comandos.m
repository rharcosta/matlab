load ibovespa_diario.txt -ascii             %para ler um arquivo ascii ou txt
plot(ibovespa_diario(:,2))                  %para visualizar apenas os dados de ibovespa (2 colunas)
sinal=ibovespa_diario(:,2);                 %atribuição dos dados de ibovespa para a variável sinal
plot(sinal)                                 % para visualizar sinal
fsinal=fft(sinal-mean(sinal));              %realiza??o da transformada de Fourie do sinal retirando o offset constante
figure(2), plot(abs(fsinal))                           %para visualizar a valor absoluto da FFT, lembrando que o resultado da FFT ? um vetor de n?meros complexos
sfsinal=fftshift(fsinal);                   %comando para deslocar o zero da FFT para o centro do vetor
plot(abs(sfsinal))
plot(abs(sfsinal(513:600)))                 %visualizar somente as maiores frequencias presentes
filt_sfsinal=sfsinal;                       %parte um para fazer o sinal filtrado
filt_sfsinal(534:1024)=zeros(491,1);        %zerando as frequencias maiores
filt_sfsinal(1:492)=zeros(492,1);           %zerando as frequencias maiores
plot(abs(filt_sfsinal(513:600)))            %para visualizar o espectro de Fourier filtrado
plot(abs(filt_sfsinal))
sfilt_sfsinal=fftshift(filt_sfsinal);       %voltando o zero para as extremidades do vetor fft
plot(abs(sfilt_sfsinal))
isfilt_sfsinal=real(ifft(sfilt_sfsinal));   %calculando a transformada de Fourier inversa do espectro filtrado
plot(isfilt_sfsinal)
plot(sinal-isfilt_sfsinal)                  %ruido
x = cumsum(ones(1024,1))-513;               %construcao do eixo das frequencias
plot(x,isfilt_sfsinal)
plot(x(513:533),abs(filt_sfsinal(513:533))) %para visualizar as frequencias maiores
