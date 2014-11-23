function [R, Word] = GuessParts(w)
load WordData.mat
WordMap=WordMapExtended;
keys=WordMap.keys();
w1 = keys{w};
w1 = WordMap(w1);
w1 = w1{2};
w = fftshift(fft(w));
w = abs(w)./max(abs(w(:)));

currentKey=keys{w}; % get current key
currentBatch=WordMap(currentKey);
F2 = currentBatch{1};
Y2=fftshift(fft(F2));
TY2=abs(Y2)./max(abs(Y2(:)));
St = sum((TY2 - mean(TY2) ).^2)
Sr = sum((TY2 - w).^2)
r = abs((St - Sr) / St)