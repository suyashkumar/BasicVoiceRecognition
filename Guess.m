function [R, Word] = Guess(FftIn)
load WordData.mat
WordMap=WordMapExtended;
FftIn = fftshift(fft(FftIn));
FftIn = abs(FftIn)./max(abs(FftIn(:)));

keys=WordMap.keys();
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    F2 = currentBatch{1};
    Y2=fftshift(fft(F2));
    TY2=abs(Y2)./max(abs(Y2(:)));
    St = sum((TY2 - mean(TY2) ).^2)
    Sr = sum((TY2 - FftIn).^2)
    r(i) = abs((St - Sr) / St)
end

R(1) = max(r);
R(2) = max((r < R(1)).*r);
R(3) = max((r < R(2)).*r);

test=find(r==R(1))
Word={}
Word{1} = keys{test};
Word{2} = keys{find(r == R(2))};
Word{3} = keys{find(r == R(3))};

