% FourierAnalysis.m
% This file completes a Fourier Transform of the recorded words in
% WordData.mat. This fourier transform data can then be plotted and will be
% used to identify vowels or train a machine learning model to do so.
% Analysis of Foruier Data also will take place here
% @author: Suyash Kumar (suyashkumar)

%% Init
fs=44100;
load WordData.mat
WordMap=WordMapExtended;

%% Recursively plot FT
% TODO: Can also store in Map for later analysis
keys=WordMap.keys();
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    for j=1:length(currentBatch)
        currentData=currentBatch{j};
        currentFFT=fftshift(fft(currentData)); % FFT
        dt=fs;
        currentF=linspace((-(1/2).*dt),((1/2).*dt),length(currentFFT)); % Get the freq vector
        figure(i+j)
        plot(currentF,currentFFT);
        title(strcat(currentKey,' FFT',int2str(j))); 
        xlabel('Frequency (Hz)')
        ylabel('UnNormalized Frequency')
        
    end
    
end
