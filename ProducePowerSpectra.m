function [PowerOutput] = ProducePowerSpectra( WordMapExtended )
% Takes in a WordMapExtended data structure and produces a corresponding
% map of PowerSpectra. NOTE THIS DOES NOT SAVE OR PRODUCE THE
% CORRESPONDIONG F VECTOR and as such should ONLY be used with inputs words
% of the same length right now

PowerOutput=containers.Map;

keys=WordMapExtended.keys();
fs=44100;

for key=keys
    key=key{1};
    currentData=WordMapExtended(key);
    for i=1:length(currentData)
        currentVector=currentData{i};
        [P1,f1] = periodogram(currentVector,[],[],fs,'power');
        if (~PowerOutput.isKey(key))
            % Add key
            PowerOutput(key)={};
        end
        currentPower=PowerOutput(key);
        currentPower{length(currentPower)+1}=P1;
        PowerOutput(key)=currentPower;
        
    end
  
   
  
    
    
    
end



end

