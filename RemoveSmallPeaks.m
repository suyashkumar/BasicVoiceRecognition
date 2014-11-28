function [ returnMap ] = RemoveSmallPeaks( inputMap, threshold )
% Remove Small Peaks below threshold percent
% @author Suyash Kumar (suyashkumar)
returnMap=containers.Map;
keys=inputMap.keys();
fs=44100;

for key=keys
    key=key{1};
    currentData=inputMap(key);
    for i=1:length(currentData)
        currentVector=currentData{i};
        mask=currentVector>(threshold.*max(currentVector));
        currentVector=currentVector.*mask;
        if (~returnMap.isKey(key))
            % Add key
            returnMap(key)={};
        end
        current=returnMap(key);
        current{length(current)+1}=currentVector;
        returnMap(key)=current;
        
    end


end

