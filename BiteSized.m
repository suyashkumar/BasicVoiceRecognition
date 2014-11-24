%Takes in Raw data and time step then outputs FFT of each time step
function [split] = BiteSized (data, timeStep)
fs = 44100;
t = timeStep;
split = cell(1,floor(length(data)/(fs*t)));
for m = 1:length(split)
    dat = data(m*(fs*t)-(m*(fs*t)-1):m*(fs*t));
    split(1,m) = {fftshift(fft(dat))};
end