function R = Guess(FftIn)
load WordData.mat
WordMap=WordMapExtended;

keys=WordMap.keys();
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    F2 = currentBatch{1};
    Y2=fftshift(fft(F2));
    TY2=abs(Y2)./max(abs(Y2(:)));
    St = sum((TY2 - mean(TY2) ).^2)
    Sr = sum((TY2 - FftIn).^2)
    R(i) = abs((St - Sr) / St)
end

