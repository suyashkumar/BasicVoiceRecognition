%% BasicMachineLearningRunner

%% Init
clear, clc
fs=44100; % Sample Rate
rSignal=audiorecorder(fs,16,1); % Recorder to hold signal

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
plot(inputSignal)
title('Input Signal')
legend

[R,Word,W]=GuessP(inputSignal);
Word
fprintf('The Predicted Vowel is "%s" based on the word "%s", the calculated value was %s \n',W,char(Word(1)),min(R))

