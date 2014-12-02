% Modified verion of the code found at http://www.mathworks.com/help/signal/examples/measuring-signal-similarities.html#zmw57dd0e510
% @author Matthew McCann (mkm4884)

function [P1,f1,P2,f2,P3,f3] = PowerSpec(word1, word2, word3, FsSig)

Fs = FsSig;         % Sampling Rate

[P1,f1] = periodogram(word1,[],[],Fs,'power');
[P2,f2] = periodogram(word2,[],[],Fs,'power');
[P3,f3] = periodogram(word3,[],[],Fs,'power');

t = (0:numel(word1)-1)/Fs;
figure(1)
subplot(2,1,1);
plot(t,word1);
ylabel('s1');
grid on
xlabel('Time (secs)')
subplot(2,1,2);
plot(f1,P1);
ylabel('P1');
grid on;
axis([0,3400,0,3e-5])
xlabel('Frequency (Hz)')

figure(2)
subplot(2,1,1);
plot(t,word2);
ylabel('s2');
xlabel('Time (secs)')
grid on
subplot(2,1,2);
plot(f2,P2);
xlabel('Frequency (Hz)')
ylabel('P2');
grid on;
axis([0,3400,0,3e-5])


figure(3)
subplot(2,1,1);
plot(t,word3);
xlabel('Time (secs)')
ylabel('s3');
grid on
subplot(2,1,2)
plot(f3,P3);
ylabel('P3');
grid on;
axis([0,3400,0,3e-5])
xlabel('Frequency (Hz)')