%Copied this function form the internet. It calculates thte cross
%correlation value for two audio inputs. I don;t think this will be
%terribly useful for our purposes.

function [C21,lag1] = CrossCorr(word1,word2)

[C21,lag1] = xcorr(word2,word1);

figure
plot(lag1,C21/max(C21));
ylabel('C21');
grid on
title('Cross-Correlations')

[~,I1] = max(abs(C21));     % Find the index of the highest peak
t21 = lag1(I1);           % Time difference between the signals s2,s1