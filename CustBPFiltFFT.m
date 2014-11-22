%%Filters Data With BPFilter and computes FFT
function [new, orig] = CustBPFiltFFT(data,lowFeq, hiFeq)
bpfilt = designfilt('bandpassfir','FilterOrder',1000,...
    'CutoffFrequency1',lowFeq,'CutoffFrequency2',hiFeq,...
    'SampleRate',44100);
filt = filter(bpfilt,data);
new = fftshift(fft(filt));
orig = fftshift(fft(data));