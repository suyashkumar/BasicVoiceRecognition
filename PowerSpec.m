% Slightly modified verion of the code found at http://www.mathworks.com/help/signal/examples/measuring-signal-similarities.html#zmw57dd0e510
% Calculated the power spectra of two inputs for comparison. Will be
% augmented soon. 

function [P1,f1,P2,f2] = PowerSpec(word1, word2, FsSig)

Fs = FsSig;         % Sampling Rate

[P1,f1] = periodogram(word1,[],[],Fs,'power');
[P2,f2] = periodogram(word2,[],[],Fs,'power');

figure
t = (0:numel(word1)-1)/Fs;
subplot(221);
plot(t,word1,'k');
ylabel('s1');
grid on
title('Time Series')
subplot(223);
plot(t,word2);
ylabel('s2');
grid on
xlabel('Time (secs)')
subplot(222);
plot(f1,P1,'k');
ylabel('P1');
grid on;
axis tight
title('Power Spectrum')
subplot(224);
plot(f2,P2);
ylabel('P2');
grid on;
axis tight
xlabel('Frequency (Hz)')