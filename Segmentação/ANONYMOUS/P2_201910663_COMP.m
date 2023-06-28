filt = ones(640);
filt(320,320) = 0.2;
filt(321,321) = 0.2;
filt(321,320) = 0.2;
filt(320,321) = 0.2;
filt(319:322,319) = 0.6*ones(4,1);
filt(319:322,322) = 0.6*ones(4,1);
filt(319,319:322) = 0.6*ones(1,4);
filt(322,319:322) = 0.6*ones(1,4);

imagens = ['a00000000';'a00000001';'a00000002';'a00000003';'a00000004';'a00000005';'a00000006';'a00000007';
        'a00000008';'a00000009';'a00000010';'a00000011';'a00000012';'a00000013';'a00000014';'a00000015';
        'a00000016';'a00000017';'a00000018';'a00000019';'a00000020';'a00000021';'a00000022';'a00000023';
        'a00000024'];
    
for i = 1:25
    A(:,:,i) = dicomread(imagens(i, 1 : 9));
end

for j = 1:25
    B = A(:,:,j);
    colormap(gray);
    ff = fft(B);
    ffs = fftshift(ff);
    mult = ffs.*filt;
    ffsm = fftshift(mult);
    ffm = fft(ffsm);
    r = real(ffm);
    
    bw = imbinarize(double(r)/max(max(double(r))),120/255);
    inter = double(bw).*double(r);
    interaux = ones(640,640);
    fibro = inter;
    ngordura = B;
    
    for i2 = 1:500
        for j2 = 1:640
            interaux(i2, j2) = inter(641 - i2, j2);
            if(ngordura(641- i2, j2) ~= interaux(i2, j2))
                ngordura(i2, j2) = 0;
            end         
        end
    end
    
    for i2 = 1:640
       for j2 = 1:640
        ngordura(i2, j2) = B(i2, j2) - interaux(i2, j2);   
       end
    end
    
    ff = fft(ngordura);
    ffs = fftshift(ff);
    mult = ffs.*filt;
    ffsm = fftshift(mult);
    ffm = fft(ffsm);
    r = real(ffm);
    bw = imbinarize(double(r)/max(max(double(r))), 120/255);
    inter2 = double(bw).*double(r);
       
    for i2 = 1:500 
        for j2 = 1:640
            fibro(i2,j2)= inter2(641-i2, j2);
        end
    end
    
    contGord = 0;
    contFibro = 0;
    contTot = 0;
    
    for i2 = 1:500
        for j2 = 1:640
            if(interaux(i2, j2) > 0)
                contTot = contTot + 1;
                contGord = contGord + 1;
            end
            
            if(fibro(i2, j2) > 0)
                contTot = contTot + 1;
                contFibro = contFibro + 1;
            end
        end
    end
    
    subplot(2,2,1), imagesc(B), title('Imagem Original')
    subplot(2,2,2), imagesc(interaux), title('Tecido Gorduroso')
    subplot(2,2,3), imagesc(ngordura), title('Tecido sem Gordura')
    subplot(2,2,4), imagesc(fibro), title('Tecido Fibroglandular')
    pause(0.1) 
 
    vT(:,:,j) = contTot;
    vF(:,:,j) = contFibro;
    vG(:,:,j) = contGord;
end

somaF = 0;
somaG = 0;
somaTot = 0;

for k = 1:25
    somaF = somaF + vF(:, :, k);
    somaG = somaG + vG(:, :, k);
    somaTot = somaTot + vT(:, :, k);
end

volume_gordura = somaG * 0.4844 * 0.4844;
volume_fibroglandular = somaF * 0.4844 * 0.4844;
volume_total = somaTot * 0.4844 * 0.4844;

percentual_gordura = (volume_gordura * 100) / volume_total + "%"

%volume_fibroglandular = volumeTot - volume_gordura
percentual_fibroglandular = (volume_fibroglandular * 100) / volume_total + "%"
