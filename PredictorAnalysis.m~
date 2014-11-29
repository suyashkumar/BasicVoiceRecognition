%% PredictorStats

%% Init
clc, clear, clf;
load lex2.mat
load TestingData.mat

%% Predict


percentCorrect=[]
cutoffs=0:.05:1;

% Cutoffs
for i=cutoffs
    % Train model based on given cut off threshold
    clear powerSpectra;
    load WordData2.mat
    powerSpectra=ProducePowerSpectra(WordMapExtended);
    powerSpectra=RemoveSmallPeaks(powerSpectra,i);
    Mdl10=trainTreeModel(powerSpectra,180,1);
    
    % Test each item in Testing Data
    load TestingData.mat
    numCorrect=0;
    totalNum=0;
    for testKey=WordMapExtended.keys()
       testKey=testKey{1};
       disp(testKey)
       currentArray=WordMapExtended(testKey);
       for j=1:length(currentArray)
           [P1,f]=ProcessForPrediction(currentArray{j},i);
            subplot(2,1,2)
            plot(f,P1)
            P1=Binning(P1,180);
          result=predict(Mdl10,P1);

          if strcmp(result,lex(testKey))
              % Correct Prediction
              disp('correct')
              disp(result)
              disp(testKey)
              numCorrect=numCorrect+1;
              totalNum=totalNum+1;
          else
              disp('incorrect')
              disp(result)
              disp(testKey)
              
              totalNum=totalNum+1;
          end
           
       end
       
    end
    percentCorrect(length(percentCorrect)+1)=numCorrect./totalNum;
   
end
figure(1)
clf
startupFigure()
plot(cutoffs,percentCorrect,'k.-','MarkerSize',20);
title('Prediction Accuracy vs. Threshold (bin size=180)')
ylim([0,1.3])
xlabel('Threshold (percent of max)')
ylabel('Prediction Accuracy')
processFigure(gca,gcf,1)
cd figures
export_fig cutoffs.pdf -nocrop
cd ..




binSizes=2:50:800;
percentCorrectBin=[]

% Bin Size
for i=binSizes
    % Train model based on given cut off threshold
    clear powerSpectra;
    load WordData2.mat
    powerSpectra=ProducePowerSpectra(WordMapExtended);
    powerSpectra=RemoveSmallPeaks(powerSpectra,0.3);
    Mdl10=trainTreeModel(powerSpectra,i,1);
    
    % Test each item in Testing Data
    load TestingData.mat
    numCorrect=0;
    totalNum=0;
    for testKey=WordMapExtended.keys()
       testKey=testKey{1};
       disp(testKey)
       currentArray=WordMapExtended(testKey);
       for j=1:length(currentArray)
           [P1,f]=ProcessForPrediction(currentArray{j},0.3);
            subplot(2,1,2)
            plot(f,P1)
            P1=Binning(P1,i);
          result=predict(Mdl10,P1);

          if strcmp(result,lex(testKey))
              % Correct Prediction
              disp('correct')
              disp(result)
              disp(testKey)
              numCorrect=numCorrect+1;
              totalNum=totalNum+1;
          else
              disp('incorrect')
              disp(result)
              disp(testKey)
              
              totalNum=totalNum+1;
          end
           
       end
       
    end
    percentCorrectBin(length(percentCorrectBin)+1)=numCorrect./totalNum;
   
end

figure(2)
clf
startupFigure()
plot(binSizes,percentCorrectBin,'k.','MarkerSize',20)
title('Prediction Accuracy vs. Bin Size (threshold=0.3)');
xlabel('Bin Size')
ylabel('Prediction Accuracy')
ylim([0,1.3])
processFigure(gca,gcf,1)
cd figures
export_fig binSizes.pdf -nocrop
cd ..

