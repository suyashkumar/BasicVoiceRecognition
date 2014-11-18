function R = Similarity(word)
load WordData.mat
currentBatch=WordMapExtended(word);
F1 = currentBatch{1};
F2 = currentBatch{2};
Y1=fftshift(fft(F1));
Y2=fftshift(fft(F2));

TY1=abs(Y1)./max(abs(Y1(:)));
TY1=(TY1 > .09).*(TY1);
TY2=abs(Y2)./max(abs(Y2(:)));
TY2=(TY2 > .09).*(TY2);

St = sum((TY1 - mean(TY1) ).^2)
Sr = sum((TY1 - TY2).^2)
R = abs((St - Sr) / St)