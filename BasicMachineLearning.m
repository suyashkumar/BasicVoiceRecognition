%% Basic Machine Learning Trainer
%  This class uses trainModel to train various machine learning
%  classifiers, all of which are saved in a file. 

%% Init
clear, clc
fs=44100; % Sample Rate
load FourierDataMurphy.mat % Load Murphy's data
load lex.mat % Load Translation Table

%% Train Models

% Model 1
% Murphy's word set, WITH TRANSLATION, doesn't include pure vowel data
load FourierDataMurphy.mat % Load Murphy's data
[Mdl1,takeN1]=trainModelTrunc(FourierMap,50,1);
disp('Done')
save('MLModel1.mat','Mdl1') % Save model

% Model 2
% Murphy's pure vowel set, doesn't include anything else! No Translation,
% bin size 100
clear FourierMap;
load VowelFourierData.mat
[Mdl2,takeN2]=trainModelTrunc(FourierMap,50,0);
save('MLModel2.mat','Mdl2') % Save Model

% Model 3
% Same as model 2 but with larger bin size
clear FourierMap;
load VowelFourierData.mat
[Mdl3,takeN3]=trainModelTrunc(FourierMap,150,0);
save('MLModel3.mat','Mdl3') % Save Model

% Model 4 
% Original Data Set of words, no translation (doesn't have these words yet)
clear FourierMap;
load FourierData.mat
Mdl4=trainModel(FourierMap,100,0);
save('MLModel4.mat','Mdl4') % Save Model

disp('Done!')



