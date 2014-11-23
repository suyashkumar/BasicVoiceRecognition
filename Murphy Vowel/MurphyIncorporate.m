%% Incorporate Murphy's files into our data structure

%% Init
clear,clc,clf
% Get files
files=dir('*.wav');
% Create a data structure
WordMapExtended=containers.Map;

for i=2:length(files)
    fname=files(i).name;
    signal=wavread(fname);
    [theKey rest]=strread(fname, '%s %s', 'delimiter','_') %Split at _
    theKey=theKey{1};
    if (WordMapExtended.isKey(theKey))
        % Simply append to the cell array
        current=WordMapExtended(theKey);
        current{length(current)+1}=signal;
        WordMapExtended(theKey)=current;
        
    else 
        % Need to create key and array for the word
        WordMapExtended(theKey)={signal};
    
    %WordMapExtended(fname(1:length(fname)-4))=signal;
    end
    
end

save('MurphyData.mat','WordMapExtended')

