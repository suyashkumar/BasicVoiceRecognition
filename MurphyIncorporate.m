%% Incorporate Murphy's files into our data structure

%% Init
clear,clc,clf
% Get files
files=dir('Murphy Vowel/*.wav');
% Create a data structure
WordMapExtended=containers.Map;

for i=2:length(files)
    fname=files(i).name;
    signal=wavread(fname);
    WordMapExtended(fname(1:length(fname)-4))=signal;
    
end

