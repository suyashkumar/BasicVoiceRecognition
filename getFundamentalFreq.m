function [ w0, F0 ] = getFundamentalFreq( waveform, Fs )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


dt=1/Fs
x=waveform
[b0,a0]=butter(2,325/(Fs/2));
xin = abs(x);
xin=filter(b0,a0,xin);
xin = xin-mean(xin);
x2=zeros(length(xin),1);
x2(1:length(x)-1)=xin(2:length(x));
zc=length(find((xin>0 & x2<0) | (xin<0 & x2>0)));
F0=0.5*Fs*zc/length(x);
fprintf('Zero-crossing F0 estimate is %3.2f Hz.\n',F0);
w0=(2*pi*F0)



end

