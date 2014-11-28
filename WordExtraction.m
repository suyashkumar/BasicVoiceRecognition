function [] = WordExtraction( WordMapExtended )
% This function takes in a WordMapExtended type data structure and then
% extracts all the words into the workspaces in the following form: 
% <word><repitition> (this is a vector).
% Example: cat1, cat2, cat3 vectors
% @author Suyash Kumar (suyashkumar)


keys=WordMapExtended.keys();


for key=keys
   currentArray=WordMapExtended(key{1});
   for i=1:length(currentArray)
       currentVector=currentArray{i};
       eval(strcat(key{1},int2str(i),'=currentVector;'));
       assignin('base', strcat(key{1},int2str(i)),currentVector)
       
   end
    
end


end

