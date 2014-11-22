%% Basic Machine Learning
%  Trains the model
%  This class is the first attempt at implementing basic machine learning
%  to classify an input signal based on the labelled data in the input mat
%  file. There should be a FourierMap HashMap inside loaded .mat file with
%  keys being the label and the value being a cell array of all the repeats
%  for that word.

%% Init
clear, clc
fs=44100; % Sample Rate
%rSignal=audiorecorder(fs,16,1,1); % Recorder to hold signal

% file1=input('Type the name of the .mat file with training data: ','s');
% loadString=strcat('load',{' '},file1);
% disp(strcat('Loaded ',{' '},file1))
% eval(loadString{1})
% 
% disp('Press Enter to record input...')
% pause
% recordblocking(rSignal,2);
% inputSignal=getaudiodata(rSignal);
load FourierData.mat

%% Train Model

% Construct the X and Y matricies
% X matrix is predictor data
% Y is class labels
translationMap=containers.Map()
X=[];
Y={};
keys=FourierMap.keys();
for i=1:length(keys)
    currentKey=keys(i);
    currentKey=currentKey{1};
    currentCells=FourierMap(currentKey);
   for j=1:length(FourierMap(currentKey))
       
       Y{length(Y)+1}=currentKey; % Set the label for the next Y entry
       theData=abs(currentCells{j})';
       
       X=vertcat(X,abs(currentCells{j})'); % add data to the X matrix, only magnitude
       
   end
    
end
disp('Training Model...')
tic
Mdl=fitcnb(X,Y)
save('TrainedModel2.mat','Mdl');
eTime=elapsedTime(toc)
disp('Done!')
disp('Took')
disp(eTime)

