function [y1,y2] = AutCor(word1, word2)

y1 = autocorr(word1);
y2 = autocorr(word2);

figure(1)
startupFigure()
subplot(2,1,1), plot(y1,'k')
title('Autocorrelation of bat')
xlabel('Lag')
ylabel('Autocorrelation')
subplot(2,1,2), plot(y2,'k')
title('Autocorrelation of yin')
xlabel('Lag')
ylabel('Autocorrelation')
processFigure(gca,gcf, 1)

