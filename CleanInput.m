%CleanInput.m
%This file cleans the input signal colledted by WordRecorder.m by setting
%a 5% of max limit ont he input signal. Any portions of the signal with a
%magnitude less than 5% of the singal's absolute maxiimum is sent to zero.
%The original and cleaned signals are visualized
%@author: Matthew McCann (mkm4884)

function currentDataClean = CleanInput(data)

currentDataClean = data; %Create new 
maxSignal = max(abs(data)); % Find maximum of input audio signal

% Set any portion of signal less than 5% of maximum to zero
for k = 1:length(data)
    if abs(data(k)) <= 0.05*maxSignal 
        currentDataClean(k) = 0;
    end
end
