% Modified verion of the code found at http://www.mathworks.com/help/signal/examples/measuring-signal-similarities.html#zmw57dd0e510
% @author Matthew McCann (mkm4884)

function [P1,f1,P2,f2,P3,f3] = PowerSpec(word1, word2, word3, FsSig)

Fs = FsSig;         % Sampling Rate
  dt=Fs;

[P1,f1] = periodogram(word1,[],[],Fs,'power');
FFT1=fftshift(fft(word1)); % FFT     
F1=linspace((-(1/2).*dt),((1/2).*dt),length(FFT1)); % Get the freq vector
[P2,f2] = periodogram(word2,[],[],Fs,'power');
FFT2=fftshift(fft(word2)); % FFT     
F2=linspace((-(1/2).*dt),((1/2).*dt),length(FFT2)); % Get the freq vector
[P3,f3] = periodogram(word3,[],[],Fs,'power');
FFT3=fftshift(fft(word3)); % FFT     
F3=linspace((-(1/2).*dt),((1/2).*dt),length(FFT3)); % Get the freq vector

t = (0:numel(word1)-1)/Fs;
figure(1)
startupFigure()
subplot(3,1,1);
plot(t,word1,'k');
ylabel('s1');
xlabel('Time (secs)')
subplot(3,1,2)
plot(F1,FFT1./max(FFT1),'k');
xlim([-3600,3600])
 xlabel('Frequency (Hz)')
 ylabel('Magnitude')
subplot(3,1,3);
plot(f1,P1./max(P1),'k');
ylabel('P1');
xlim([0,3600])
xlabel('Frequency (Hz)')
processFigure(gca,gcf, 1)

figure(2)
startupFigure()
subplot(3,1,1);
plot(t,word1,'k');
ylabel('s2');
xlabel('Time (secs)')
subplot(3,1,2)
plot(F2,FFT2./max(FFT2),'k');
xlim([-3600,3600])
 xlabel('Frequency (Hz)')
 ylabel('Magnitude')
subplot(3,1,3);
plot(f2,P2./max(P2),'k');
ylabel('P2');
xlim([0,3600])
xlabel('Frequency (Hz)')
processFigure(gca,gcf, 1)

figure(3)
startupFigure()
subplot(3,1,1);
plot(t,word1,'k');
ylabel('s3');
xlabel('Time (secs)')
subplot(3,1,2)
plot(F3,FFT3./max(FFT3),'k');
xlim([-3600,3600])
 xlabel('Frequency (Hz)')
 ylabel('Magnitude')
subplot(3,1,3);
plot(f3,P3./max(P3),'k');
ylabel('P3');
xlim([0,3600])
xlabel('Frequency (Hz)')
processFigure(gca,gcf, 1)