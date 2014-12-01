function [R,Word,Rall] = Guess(FftIn)
load WordData.mat
WordMap=WordMapExtended;
FftIn = abs(FftIn)./max(abs(FftIn(:)));
FftIn = Binning(FftIn,50);

keys=WordMap.keys();
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    F2 = currentBatch{1};
    Y2=fftshift(fft(F2));
    TY2=abs(Y2)./max(abs(Y2(:)));
    TY2 = Binning(TY2,50);
    St = sum((TY2 - mean(TY2) ).^2)
    Sr = sum((FftIn - mean(TY2)).^2)
    r(i) = (Sr / St)
end
r = abs(r - 1)
rt = r;

R(1) = min(r)
rt(find(r == R(1))) = 10000000; 
R(2) = min((rt > R(1)).*rt)
rt(find(r == R(2))) = 10000000;
R(3) = min((rt > R(2)).*rt)

test=find(r==R(1))
Word={}
Word{1} = keys{test};
Word{2} = keys{find(r == R(2))};
Word{3} = keys{find(r == R(3))};
Rall = r;
