%%Filters Data With BPFilter and computes FFT
function [new, orig] = BPFiltFFT(data)
bpfilt = designfilt('bandpassfir','FilterOrder',1000,...
    'CutoffFrequency1',300,'CutoffFrequency2',3400,...
    'SampleRate',44100);
filt = filter(bpfilt,data);
new = fftshift(fft(filt));
orig = fftshift(fft(data));