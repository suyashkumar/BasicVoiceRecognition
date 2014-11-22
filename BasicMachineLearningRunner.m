%% BasicMachineLearningRunner

%% Init
clear, clc
fs=44100; % Sample Rate
rSignal=audiorecorder(fs,16,1,1); % Recorder to hold signal
load TrainedModel2.mat

%% Get Input
% file1=input('Type the name of the .mat file with training data: ','s');
% loadString=strcat('load',{' '},file1);
% disp(strcat('Loaded ',{' '},file1))
% eval(loadString{1})

disp('Press Enter to record input...')
pause
recordblocking(rSignal,2);
inputSignal=getaudiodata(rSignal);

% Calc FFT
inputfft=fftshift(fft(inputSignal));

% Predict: 
tic
label=predict(Mdl,abs(inputfft)');
toc
disp('Your Prediction: ')
disp(label{1})
