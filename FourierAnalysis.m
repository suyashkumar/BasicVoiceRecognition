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
FourierMap=containers.Map; % Create Foruier Map

%% Recursively plot FT
keys=WordMap.keys();
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    for j=1:length(currentBatch)
        currentData=currentBatch{j};
        currentFFT=fftshift(fft(currentData)); % FFT
        dt=fs;
        currentF=linspace((-(1/2).*dt),((1/2).*dt),length(currentFFT)); % Get the freq vector
        
        figure()
        plot(currentF,currentFFT);
        title(strcat(currentKey,' FFT',int2str(j))); 
        xlabel('Frequency (Hz)')
        ylabel('UnNormalized Frequency')
        
        % Add to Map
        if FourierMap.isKey(currentKey)
           % Append to cell array
           currentArray=FourierMap(currentKey);
           currentArray{length(currentArray)+1}=currentFFT;
           FourierMap(currentKey)=currentArray;
        else
            % Add Key and Data to Map
            FourierMap(currentKey)= {currentFFT}
            
        end
        
    end
    
    
end
 save('FourierData.mat','FourierMap') % Save Map to file
