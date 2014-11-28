%% BasicMachineLearningRunner

%% Init
clear, clc
fs=44100; % Sample Rate
rSignal=audiorecorder(fs,16,1,0); % Recorder to hold signal
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
figure(1)
subplot(2,1,1)
plot(inputSignal)


%[inputfft, inputSignalfft]=BPFiltFFT(inputSignal);
load MLModel10.mat;


% Calc vector size
%inputfft=fftshift(fft(inputSignal));
%inputfft=inputfft(1:takeN1);
%inputfft=Binning(inputfft,100);
%inputfft=inputfft./max(inputfft); % Normalize
%inputSignal=inputSignal./max(inputSignal);
P1=ProcessForPrediction(inputSignal,0.35);
%P1=P1(1:takeN6);
P1=Binning(P1,180);
subplot(2,1,2)
plot(P1)

% Predict: 
tic
disp('Prediction')
predict(Mdl10,P1)
toc



