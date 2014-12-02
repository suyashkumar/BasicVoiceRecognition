load WordData.mat
WordMap = WordMapExtended;
cat = WordMap('mat');
bat = WordMap('bat');
keys = WordMap.keys();
sound(cat{2},44100)
for i=1:WordMap.length()
    currentKey=keys{i} % get current key
    currentBatch=WordMap(currentKey);
    for j=1:length(currentBatch)
        currentData=currentBatch{j};
        r = max(currentData)
        if r<.1
            %sound(currentData,44100)
            pause(1)
        end
    end
end