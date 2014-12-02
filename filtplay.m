load WordData.mat
WordData = WordMapExtended;
data = WordData('yin');
data2 = data{1};
y = BiteSized(data2,.025);
for r = 1:length(y)
    currentF=linspace((-(1/2).*44100),((1/2).*44100),length(y{1,r}));
    figure(r)
    plot(currentF,y{1,r});
end
% bpfilt = designfilt('bandpassfir','FilterOrder',1000,...
%     'CutoffFrequency1',300,'CutoffFrequency2',3400,...
%     'SampleRate',44100);
% %filt1 = filter(bpfilt,data2);
% filt = CleanInput(data2);
% sound(data2,44100)
% pause(3);
% sound(filt,44100)