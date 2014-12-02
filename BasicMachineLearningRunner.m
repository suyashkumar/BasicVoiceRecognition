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

bpfilt = designfilt('bandpassfir','FilterOrder',1000,...
    'CutoffFrequency1',300,'CutoffFrequency2',3400,...
    'SampleRate',44100);
%inputSignal = filter(bpfilt,inputSignal);


%inputSignal=CleanInput(inputSignal);
disp('Playback')
sound(inputSignal,fs)
figure(1)
subplot(2,1,1)
plot(inputSignal)


%[inputfft, inputSignalfft]=BPFiltFFT(inputSignal);
load MLModel11.mat;

[P1,f]=ProcessForPrediction(inputSignal,0.35);
%P1=P1(1:takeN6);
subplot(2,1,2)
plot(f,P1)
P1=Binning(P1,180);


% Predict: 
tic
disp('Prediction')
predict(Mdl11,P1)
toc



