function [ Mdl,takeN ] = trainModel( FourierMap, binningFactor, useTranslation )
%% Basic Machine Learning Model Trainer
%  Trains the model, truncates to only training with first x frequencies
%  This class is the first attempt at implementing basic machine learning
%  to classify an input signal based on the labelled data in the input mat
%  file. There should be a FourierMap HashMap inside loaded .mat file with
%  keys being the label and the value being a cell array of all the repeats
%  for that word.

%% Init
fs=44100; % Sample Rate
load lex.mat
%% Train Model

% Construct the X and Y matricies
% X matrix is predictor data
% Y is class labels
X=[];
Y={};
keys=FourierMap.keys();

% Get how long the of the freq vector to keep
currentKey=keys(1);
currentKey=currentKey{1};
currentCells=FourierMap(currentKey);
currentData=abs(currentCells{1});
takeN=round(.5.*length(currentData));

for i=1:length(keys)
    
    currentKey=keys(i);
    currentKey=currentKey{1};
    currentCells=FourierMap(currentKey);
    
   for j=1:length(FourierMap(currentKey))
       if (~useTranslation)
           Y{length(Y)+1}=currentKey; % Set the label for the next Y entry
       else
           Y{length(Y)+1}=lex(currentKey) % Use the vowel translation 
       end
       
       theData=abs(currentCells{j})';
       theData=theData(1:takeN);
       theData=Binning(theData,binningFactor); % Binning 
       theData=theData./max(theData); % Normalize
       
       X=vertcat(X,abs(theData)); % add data to the X matrix, only magnitude
       
   end
    
end
disp(Y)
disp('Training Model...')
tic
Mdl=fitctree(X,Y)
toc
disp('Done!')





end

