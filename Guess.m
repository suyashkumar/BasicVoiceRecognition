function [R,Word,Rall] = Guess(FftIn)
B = 250
load WordData.mat
WordMap=WordMapExtended;
FftIn=fftshift(fft(FftIn));
currentF=linspace((-(1/2).*44100),((1/2).*44100),length(FftIn)); % Get the freq vector
FftIn = abs(FftIn)./max(abs(FftIn(:)));
FftIn = FftIn.^2;
FftIn = (FftIn.*(FftIn > .35));
FftIn = Binning(FftIn,B);
FftIn = FftIn./(max(FftIn));

keys=WordMap.keys();
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    F2 = currentBatch{1};
    Y2=fftshift(fft(F2));
    Y2 = Y2.^2;
    TY2=abs(Y2)./max(abs(Y2(:)));
    TY2=(TY2.*(TY2 > .35));
    TY2 = Binning(TY2,B);
    TY2 = TY2./max(TY2);
    Sr(i) = sum((FftIn - TY2).^2)
    plot(FftIn)
    hold on
    plot(TY2)
    hold off
end
R = Sr;
r = Sr;
rt = r;

R(1) = min(r);
rt(find(r == R(1))) = NaN; 
R(2) = min(rt);
rt(find(r == R(2))) = NaN;
R(3) = min(rt);

test=find(r==R(1));
Word={}
Word{1} = keys{test};
Word{2} = keys{find(r == R(2))};
Word{3} = keys{find(r == R(3))};
Rall = r;

currentKey=keys{find(r==R(1))};
currentBatch=WordMap(currentKey);
F2 = currentBatch{1};
Y2=fftshift(fft(F2));
Y2 = Y2.^2;
TY2=abs(Y2)./max(abs(Y2(:)));
TY2=(TY2.*(TY2 > .35));
TY2 = Binning(TY2,B);
TY2 = TY2./(max(TY2));

figure(2)
plot(TY2)
hold on
plot(FftIn,'g')
hold off
title('Frequency Analysis of Top Result')