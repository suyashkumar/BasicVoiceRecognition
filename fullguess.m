function gguess = fullguess (data)
load ('MurphyVowelData')
WordMap = WordMapExtended;
keys = WordMapExtended.keys();
data = data./max(data);
[dat,f1] = periodogram(data,[],[],44100,'power');
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    for j=1:length(currentBatch)
        currentData=currentBatch{j};
        currentData=currentData./max(currentData);
        [vp,fp] = periodogram(currentData,[],[],44100,'power');
        if length(vp)>length(dat)
            vp1 = vp(1:length(dat));
            dat1=dat;
        elseif length(vp)<length(dat)
            vp1 = vp;
            dat1=dat(1:length(vp));
        else
            vp1 = vp;
            dat1= dat;
        end
        vp1 = vp1./max(vp1);
        dat1= dat1./max(dat1);
        if i==1 && j==1
            length(vp1)
            length(dat1)
            gguess = currentKey;
            fprintf('%s',gguess)
            mindiff = sum(abs(dat1-vp1));
        else
            newdiff = sum(abs(dat1-vp1));
            if newdiff<mindiff
                mindiff = newdiff;
                gguess = currentKey;
                fprintf('%s',gguess)
            end
        end
        
    end
end

