%% BasicMachineLearningRunner
%  @author Suyash Kumar (suyashkumar)
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

[t]=fullguess(inputSignal);
fprintf('The Predicted Vowel is "%s" ',t)

