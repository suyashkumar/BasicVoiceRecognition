function gguess = fullguess (data)
load ('MurphyVowelData')
WordMap = WordMapExtended;
keys = WordMapExtended.keys();
[dat,f1] = periodogram(data,[],[],44100,'power');
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    for j=1:length(currentBatch)
        currentData=currentBatch{j};
        [vp,fp] = periodogram(currentData,[],[],44100,'power');
        length(vp)
        length(dat)
        if i==1
            gguess = currentKey;

            mindiff = sum(abs(dat-vp));
        else
            newdiff = sum(abs(dat-vp));
            if newdiff<mindiff
                mindiff = newdiff;
                gguess = currentKey;
            end
        end
        
    end
end

