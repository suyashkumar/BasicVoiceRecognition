function [ outputSignal ] = ProcessForPrediction( inputSignal, threshold)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
fs=44100;
[P1, f]=periodogram(inputSignal,[],[],fs,'power');
mask=P1>(threshold*max(P1));
P1=P1.*mask;
outputSignal=P1./max(P1);

end

