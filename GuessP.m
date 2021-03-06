function [R,Word,W,Rall] = GuessP(FftIn)
%%Guess.m
%%Takes an input and compares it to pre-recorded words.  Compares these
%%values and estimates the vowel type of the mono-syllabic word.
%%@author: Brendon Colbert

%Constants
B1 = 150;
B2= 350;

%Load Data
load MurphyVowelData.mat
WordMap=WordMapExtended;
FftIn=fftshift(fft(FftIn));
length(FftIn)
currentF=linspace((-(1/2).*44100),((1/2).*44100),length(FftIn)); % Get the freq vector

%Frequency Component
FftIn = abs(FftIn)./max(abs(FftIn(:)));
FftIn = FftIn.^2;

%Cutoff Lower Frequencies
FftIn = (FftIn.*(FftIn > .2));

%First Bin
FftIn1 = Binning(FftIn,B1);
FftIn1 = FftIn1./(max(FftIn1));

%Second Bin
FftIn2 = Binning(FftIn,B2);
FftIn2 = FftIn2./(max(FftIn2));

keys=WordMap.keys();
for i=1:WordMap.length()
    currentKey=keys{i}; % get current key
    currentBatch=WordMap(currentKey);
    F2 = currentBatch{length(currentBatch)};
    if F2 < 88200;
        F2 = FftIn.*0;
    end
    %Transform to Frequency Domain
    Y2=fftshift(fft(F2));
    length(Y2)
    Y2 = Y2.^2;
    TY2=abs(Y2)./max(abs(Y2(:)));
    TY2=(TY2.*(TY2 > .2));
    
    %First Bin
    TY21 = Binning(TY2,B1);
    TY21 = TY21./max(TY21);
    
    %Second Bin
    TY22 = Binning(TY2,B2);
    TY22 = TY22./max(TY22);
    
    length(FftIn2)
    length(TY22)
    %Difference Value Calculation
    length(FftIn1)
    length(TY21)
    Sr(i) = sum((FftIn1 - TY21).^2) + sum((FftIn2 - TY22).^2);
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
TY2=(TY2.*(TY2 > .2));
TY2 = Binning(TY2,B1);
TY2 = TY2./(max(TY2));

%Vowel Sound
W = char(Word(1))
if W(2) == 'a'
    W = 'a';
elseif W(2) == 'i'
    W = 'i';
end

figure(2)
plot(TY2)
hold on
plot(FftIn1,'g-')
hold off
title('Frequency Analysis of Top Result')