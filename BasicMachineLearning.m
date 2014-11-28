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
% load FourierDataMurphy.mat % Load Murphy's data
% [Mdl1,takeN1]=trainModelTrunc(FourierMap,100,1);
% disp('Done')
% save('MLModel1.mat','Mdl1','takeN1') % Save model

% Model 2
% Murphy's pure vowel set, doesn't include anything else! No Translation,
% bin size 100
% clear FourierMap;
% load VowelFourierData.mat
% [Mdl2,takeN2]=trainModelTrunc(FourierMap,100,0);
% save('MLModel2.mat','Mdl2','takeN2') % Save Model
% 
% % Model 3
% % Same as model 2 but with larger bin size
% clear FourierMap;
% load WordData.mat
% [Mdl3,takeN3]=trainModelTrunc(FourierMap,100,0);
% save('MLModel3.mat','Mdl3','takeN3') % Save Model

%Model 4 
% Original Data Set of words, no translation, uses POWER SPECTRA
% 60/.3365=178.3061 units/60Hz
% Bin at 60 hz

clear FourierMap;
load WordData.mat
powerSpectra=ProducePowerSpectra(WordMapExtended);
Mdl4=trainModel(powerSpectra,180,0);
save('MLModel4.mat','Mdl4') % Save Model

%Model 5
% Original Data Set of words, no translation, uses POWER SPECTRA

clear powerSpectra;
load WordData.mat
powerSpectra=ProducePowerSpectra(WordMapExtended);
Mdl5=trainModel(powerSpectra,500,0);
save('MLModel5.mat','Mdl5') % Save Model

%Model 6
% Original Data Set of words, no translation, uses POWER SPECTRA
% Only keeps peaks 15% of max, bin at 180

clear powerSpectra;
load WordData.mat
powerSpectra=ProducePowerSpectra(WordMapExtended);
powerSpectra=RemoveSmallPeaks(powerSpectra,0.15);
[Mdl6,takeN6]=trainModelTrunc(powerSpectra,180,0);
save('MLModel6.mat','Mdl6','takeN6') % Save Model

%Model 7
% Original Data Set of words, no translation, uses POWER SPECTRA
% Only keeps peaks 25% of max bin at 180

clear powerSpectra;
load WordData.mat
powerSpectra=ProducePowerSpectra(WordMapExtended);
powerSpectra=RemoveSmallPeaks(powerSpectra,0.25);
Mdl7=trainModel(powerSpectra,180,1);
save('MLModel7.mat','Mdl7') % Save Model

%Model 8
% Original Data Set of words, no translation, uses POWER SPECTRA
% Only keeps peaks 35% of max bin at 180

clear powerSpectra;
load WordData.mat
powerSpectra=ProducePowerSpectra(WordMapExtended);
powerSpectra=RemoveSmallPeaks(powerSpectra,0.35);
Mdl8=trainModel(powerSpectra,180,0);
save('MLModel8.mat','Mdl8') % Save Model

%Model 9
% Original Data Set of words, no translation, uses POWER SPECTRA
% Only keeps peaks 35% of max bin at 180
% TRAINS A CLASSIFICATION TREE

clear powerSpectra;
load WordData.mat
powerSpectra=ProducePowerSpectra(WordMapExtended);
powerSpectra=RemoveSmallPeaks(powerSpectra,0.35);
Mdl9=trainTreeModel(powerSpectra,180,0);
save('MLModel9.mat','Mdl9') % Save Model


%Model 10
% Original Data Set of words, no translation, uses POWER SPECTRA
% Only keeps peaks 35% of max bin at 180
% TRAINS A CLASSIFICATION TREE
% Uses translation

clear powerSpectra;
load WordData.mat
powerSpectra=ProducePowerSpectra(WordMapExtended);
powerSpectra=RemoveSmallPeaks(powerSpectra,0.35);
Mdl10=trainTreeModel(powerSpectra,180,1);
save('MLModel10.mat','Mdl10') % Save Model











disp('Done!')



