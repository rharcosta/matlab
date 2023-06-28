function [imfiltrada] = filtra_201910663(original, tipo_de_filtro)
    tam = size(original); %tamanho da imagem
    if tipo_de_filtro == "butter"
        fm = butter2d_201910663(tam, 5, 0.25);
    else
        fm = rampa2d_201910663(tam);
    end
    
    for i = 1:tam(3)
        fft_original(:,:,i) = fftshift(fft2(original(:,:,i)));
    end
    
    mfft_original = fft_original.*fm; %multiplicação ponto a ponto (mesma linha, mesma coluna)
    
    for i = 1:tam(3)
        inv_mfft_original(:,:,i) = real(ifft2(fftshift(mfft_original(:,:,i))));
    end
    
    imfiltrada = inv_mfft_original;
end

%rosas = imread('ROSAS.bmp', 'bmp');
%imagesc(rosas)
%frosas = filtra_201910663(rosas, "butter");
%imagesc(frosas)
