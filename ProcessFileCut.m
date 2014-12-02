function Y = ProcessFileCut(word)
fs=44100;
load WordData.mat
outer = WordMapExtended(word);
for i = 1:length(outer)
    currentData=outer{i};
    currentFFT=fftshift(fft(currentData)); % FFT
    TcurrentFFT=abs(currentFFT)./max(abs(currentFFT(:)));
    TcurrentFFT=(TcurrentFFT > .09).*(TcurrentFFT);
    dt=fs;
    currentF=linspace((-(1/2).*dt),((1/2).*dt),length(TcurrentFFT)); % Get the freq vector
    figure(i)
    subplot(1,2,1)
    Y = TcurrentFFT./max(TcurrentFFT(:));
    plot(currentF,Y);
    subplot(1,2,2)
    plot(currentF,abs(currentFFT)./abs(max(currentFFT(:))))
    title(strcat(word,' FFT')); 
    xlabel('Frequency (Hz)')
    ylabel('UnNormalized Frequency')
end
