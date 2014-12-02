function  [a] = FFTGraphMaker(FftIn,n,FftIn2,n2)
%%FFTGraphMaker.m
%%Takes an input and graphs the recorded input and fft transform
%%@author: Brendon Colbert
T = 1:length(FftIn);
T = T.*2./length(FftIn);

subplot(2,1,1)
plot(T,FftIn,'k')
title(['Recorded Sound for ',n])
ylabel('Amplitude')
xlabel('Time (seconds)')
set(gca, 'box','off');

FftIn=fftshift(fft(FftIn));
CurrentF=linspace((-(1/2).*44100),((1/2).*44100),length(FftIn)); % Get the freq vector
FftInC = (FftIn)./max((FftIn(:)));

subplot(2,1,2)
plot(CurrentF, FftInC,'k')
title(['Normalized Fast Fourier Transform for ',n])
ylabel('Amplitude')
xlabel('Frequency (hz)')
set(gca, 'box','off');

figure(2)
subplot(2,1,1)
%Frequency Component
FftIn = abs(FftIn)./max(abs(FftIn(:)));
FftIn = FftIn.^2;

%Cutoff Lower Frequencies
FftIn = (FftIn.*(FftIn > .35));

plot(CurrentF,FftIn,'k')
title(['Processed Fast Fourier Transform for ',n])
ylabel('Amplitude')
xlabel('Frequency (hz)')
set(gca, 'box','off');

subplot(2,1,2)
%Frequency Component
FftIn2=fftshift(fft(FftIn2));
FftIn2 = abs(FftIn2)./max(abs(FftIn2(:)));
FftIn2 = FftIn2.^2;

%Cutoff Lower Frequencies
FftIn2 = (FftIn2.*(FftIn2 > .35));

plot(CurrentF,FftIn2,'k')
title(['Processed Fast Fourier Transform for ',n2])
ylabel('Amplitude')
xlabel('Frequency (hz)')
set(gca, 'box','off');


