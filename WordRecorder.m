% Gets a recording from the user and saves it to a HashMap in WordData.mat
% with the key being the spoken word (as a string). 
% @author: Suyash Kumar (suyashkumar)


%% Init
clear, clc
load TestSet10.mat;
load lex2.mat;
%WordMapExtended=containers.Map;
fs=44100; % Sample Rate
rSignal=audiorecorder(fs,16,1,0); % Recorder to hold signal


%% Get Signal iterativly
while 1
    disp('Press enter to record word (2s) (ctrl+c to exit)')
    pause
    recordblocking(rSignal,2);% Record 2 seconds of audio into 
    word=input('Thanks! Now, what was the word you spoke (type lower case): ','s');

    sampleSignal=getaudiodata(rSignal);
    
    % Check to see if key is a word
    if (WordMapExtended.isKey(word))
        % Simply append to the cell array
        current=WordMapExtended(word);
        current{length(current)+1}=sampleSignal
        WordMapExtended(word)=current;
        
    else 
        % Need to create key and array for the word
        WordMapExtended(word)={sampleSignal};
        
    end
    if (~lex.isKey(word))
        % Add to lexicon and save
        vowel=input('Word not in lexicon, what is vowel designation:','s');
        lex(word)=vowel;
        save('lex2.mat','lex');
    end
    save('TestSet10.mat','WordMapExtended') % Save Map to file. 
end

