load MurphyWordData.mat
WordData = WordMapExtended;
load MurphyVowelData.mat
VowelData = WordMapExtended;

keys = WordData.keys();
keys2 = VowelData.keys();

word = WordData('hat');
vowel = VowelData('as');

word = CleanInput(word{1,1});
split = word;

count = 1;
for w = 1:length(keys2)
    currentKey = keys2{w};
    dat = VowelData(currentKey);
    [VPY,fVPY] = pyulear(dat{1,1},12,256,44100);

    if max(split)>0
        [SPY,fSPY] = pyulear(split,12,256,44100);
        figure(count)
        subplot(2,1,1)
        plot(fSPY,SPY);
        subplot(2,1,2)
        plot(fVPY,VPY)
        title(keys2{w});
        count = count+1;
    end

end