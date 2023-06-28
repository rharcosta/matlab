%4096 dados = metade = 2049 (pois começa do 0)
load ibovespa.txt -ascii
numero = ibovespa(:,2);
plot(numero)
fib = fft(numero-mean(numero));
figure(2), plot(abs(fib))
figure(2), plot(abs(fftshift(fib)))
x = (cumsum(ones(4096,1)) - 2049)/4096; %soma acumulada de vetores de 1 até 4096
%isso vai dar menos meio
figure(2), plot(x, abs(fftshift(fib)))
xlabel('f(1/d)')
ffib = fftshift(fib);
figure(3), plot(x(2049:2049+200), abs(ffib(2049:2049+200)))
ffib(1:2048-100) = zeros(1948,1); %zerar os números negativos após o centro
ffib(2149:4096) = zeros(1948,1); %zerar os número positivos após o centro
figure(3), plot(x(2049:2049+200), abs(ffib(2049:2049+200)))
iffib = real(ifft(fftshift(ffib)));
figure(4), plot(iffib)
xd = cumsum(ones(4096,1)); %outro vetor
figure(5), plot(xd, numero, 'b-', xd, iffib, 'r-')
figure(5), plot(xd, numero-mean(numero), 'b-', xd, iffib, 'r-') %média do gráfico
figure(6), plot(xd, iffib-(numero-mean(numero))) %gráfico só do ruído

