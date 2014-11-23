%% BasicMachineLearningRunner

%% Init
clear, clc
fs=44100; % Sample Rate
rSignal=audiorecorder(fs,16,1,1); % Recorder to hold signal
%load TrainedModel2.mat
load lex.mat

%% Get Input
% file1=input('Type the name of the .mat file with training data: ','s');
% loadString=strcat('load',{' '},file1);
% disp(strcat('Loaded ',{' '},file1))
% eval(loadString{1})

disp('Press Enter to record input...')
pause
disp('Recording...')
recordblocking(rSignal,2);
inputSignal=getaudiodata(rSignal);
disp('Thanks')


%inputSignal=CleanInput(inputSignal);
disp('Playback')
sound(inputSignal,fs)

%[inputfft, inputSignalfft]=BPFiltFFT(inputSignal);
load MLModel1.mat;


% Calc vector size
inputfft=fftshift(fft(inputSignal));
inputfft=inputfft(1:takeN1);
inputfft=Binning(inputfft,100);
inputfft=inputfft./max(inputfft); % Normalize

% Predict: 
disp('Prediction')
predict(Mdl1,abs(inputfft))



