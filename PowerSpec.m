% Slightly modified verion of the code found at http://www.mathworks.com/help/signal/examples/measuring-signal-similarities.html#zmw57dd0e510
% Calculated the power spectra of two inputs for comparison. Will be
% augmented soon. 

function [P1,f1,P2,f2] = PowerSpec(word1, word2, word3, FsSig)

Fs = FsSig;         % Sampling Rate

[P1,f1] = periodogram(word1,[],[],Fs,'power');
[P2,f2] = periodogram(word2,[],[],Fs,'power');
[P3,f3] = periodogram(word3,[],[],Fs,'power');

figure(1)
t = (0:numel(word1)-1)/Fs;
subplot(321);
plot(t,word1,'k');
ylabel('s1');
grid on
title('Time Series')
subplot(323);
plot(t,word2);
ylabel('s2');
grid on
subplot(325);
plot(t,word3);
ylabel('s2');
grid on
xlabel('Time (secs)')
subplot(322);
plot(f1,P1,'k');
ylabel('P1');
grid on;
axis([0,3400,0,3e-5])
title('Power Spectrum')
subplot(324);
plot(f2,P2);
ylabel('P2');
grid on;
axis([0,3400,0,3e-5])
subplot(326)
plot(f3,P3);
ylabel('P3');
grid on;
axis([0,3400,0,3e-5])
xlabel('Frequency (Hz)')