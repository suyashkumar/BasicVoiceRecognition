function [ filteredSignal ] = filterBkgNoise( signal, noise, fs )
% Uses Least mean squares filtering to filter out noise

hlms2 = dsp.LMSFilter('Length',11, ...
   'Method','Normalized LMS',...
   'AdaptInputPort',true, ...
   'StepSizeSource','Input port', ...
   'WeightsOutputPort',false);

hfilt2 = dsp.FIRFilter('Numerator', fir1(10,[.5, .75]));

stepSize=1/fs;
adaptation=1;
[y, filteredSignal] = step(hlms2,noise,signal,stepSize,adaptation)

end

