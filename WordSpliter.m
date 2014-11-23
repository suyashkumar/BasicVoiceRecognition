load WordData.mat
WordMap = WordMapExtended;
%% Gets Data
capData = WordMap('cap');
batData = WordMap('bat');
cdata = capData{1};
cdata2 = batData{1};

%% Filters Data
bpfilt = designfilt('bandpassfir','FilterOrder',1000,...
    'CutoffFrequency1',300,'CutoffFrequency2',3400,...
    'SampleRate',44100);
cdat = filter(bpfilt,cdata);
cdat2 = filter(bpfilt,cdata2);

maxSignal = max(abs(cdat)); % Find maximum of input audio signal
maxSignal2 = max(abs(cdat2));
for k = 1:length(cdat)
    if abs(cdat(k)) <= 0.1*maxSignal 
        cdat(k) = 0;
    end
end
for k = 1:length(cdat2)
    if abs(cdat2(k)) <= 0.1*maxSignal2
        cdat2(k) = 0;
    end
end

%% Breaks Data Up
count = 1;
count1 =1;
count2 =1;

% Sample rate is 44100 this gets blocks of .025 seconds
while(count*1102<length(cdat))
    dat = cdat(count*1102-1101:count*1102); % Gets blocks of Data1
    dat2 = cdat2(count*1102-1101:count*1102); % Gets blocks of Data2
    
    %Frequencies for Plotting
    currentF=linspace((-(1/2).*44100),((1/2).*44100),length(dat)); 
    currentF2=linspace((-(1/2).*44100),((1/2).*44100),length(dat2));
    
    %Perform FFT
    fftr = fftshift(fft(dat)); 
    fftr2 = fftshift(fft(dat2)); 
    
    %First instances of each sound data are plotted on figure 1
    %If block of Data 1 contains non filtered sound data, it is plotted
    if max(dat)>0 
        figure(count1)
        subplot(2,1,1)
        plot(currentF, abs(fftr)/max(abs(fftr)))
        count1= count1+1;
%         t = sum(abs(fftr(551+535:551+615)));
%         y = sum(abs(fftr(44100+1660:44100+1760)));
%         title(strcat('585 Hz = ',int2str(t),' 1710 Hz = ', int2str(y)))
    end
    
    %If block of Data2 contains sound data it is plotted
    if max(dat2)>0
        figure(count2)
        subplot(2,1,2)
        plot(currentF2, abs(fftr2)/max(abs(fftr2)))
        count2 = count2+1;
%         t = sum(abs(fftr2(44100+535:44100+615)));
%         y = sum(abs(fftr2(44100+1660:44100+1760)));
%         title(strcat('585 Hz = ',int2str(t),' 1710 Hz = ', int2str(y)))
    end
    count = count+1;
end
