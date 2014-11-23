% Binning.m
% This file reduces the size of an input vector by a binning factor 'n' (some multiple of 2)
% by taking the average of every n terms and sets that mean as an element of the output vector.
%@author: Matthew McCann (mkm4884)

function binnedData = Binning(input,factor)

remainder = mod(length(input), factor);
k = 1;
l = 1;
if remainder == 0
    for m = 1:factor:length(input)
        binnedData(k) = mean(input(m:m+(factor-1)));
        k = k+1;
    end    
else
    for n = 1:factor:length(input)-remainder
        binnedData(l) = mean(input(n:n+(factor-1)));
        l = l+1;
    end
        binnedData(l) = mean(input((n+factor):end))  ;

end