[a, Fa] = audioread("A.m4a");
[e, Fe] = audioread("E.m4a");
[i, Fi] = audioread("I.m4a");
[o, Fo] = audioread("O.m4a");
[u, Fu] = audioread("U.m4a");

%reproduzir som: sound(a, Fs);

figure; spectrogram(a,1024,1023,[],Fa,'yaxis');
figure; spectrogram(e,1024,1023,[],Fe,'yaxis');
figure; spectrogram(i,1024,1023,[],Fi,'yaxis');
figure; spectrogram(o,1024,1023,[],Fo,'yaxis');
figure; spectrogram(u,1024,1023,[],Fu,'yaxis');
