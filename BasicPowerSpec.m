function [P1,f1] = BasicPowerSpec(word, Fs)

[P1,f1] = periodogram(word,[],[],Fs,'power');

figure(1)
subplot(2,1,1), plot(word)
title(strcat('Time Domain Represntation of ', word))
xlabel('Samples')
ylabel('Magnitude')
subplot(2,1,2), plot(f1,P1)
xlim([0,2000])
title(strcat('Power Spectral Density of ', word))
xlabel('Frequency')
ylabel('Magnitude')


