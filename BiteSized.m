function split = BiteSized(data,timeStep)

fs = 44100;
t = timeStep;
split = cell(1,floor(length(data)/(fs*t)));

for r = 1:length(split)
    split(1,r) = {data(r*(fs*t)-((fs*t)-1):r*(fs*t))};
end