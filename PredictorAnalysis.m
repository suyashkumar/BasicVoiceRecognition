%% PredictorStats
%  @author Suyash Kumar (suyashkumar)

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

          if strcmp(result{1},lex(testKey))
              % Correct Prediction
              disp('correct')
              disp(result{1})
              disp(lex(testKey))
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
plot(cutoffs,percentCorrect,'k.-','MarkerSize',30);
title('Prediction Accuracy vs. Threshold (bin size=180)')
ylim([0,1.3])
xlabel('Threshold (percent of max)')
ylabel('Prediction Accuracy')
processFigure(gca,gcf,1)
cd figures
export_fig cutoffs.pdf -nocrop
cd ..

binSizes=2:10:800;
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
plot(binSizes,percentCorrectBin,'k.','MarkerSize',30)
title('Prediction Accuracy vs. Bin Size (threshold=0.3)');
xlabel('Bin Size')
ylabel('Prediction Accuracy')
ylim([0,1.3])
processFigure(gca,gcf,1)
cd figures
export_fig binSizes.pdf -nocrop
cd ..

%% Compare accuracy over difficulty:

% Train model on WordData2.mat
 clear powerSpectra;
    load WordData2.mat
    powerSpectra=ProducePowerSpectra(WordMapExtended);
    powerSpectra=RemoveSmallPeaks(powerSpectra,0.35);
    Mdl10=trainTreeModel(powerSpectra,180,1);

% Test on all Test Sets: 

testSets={'TestSet1.mat','TestSet2.mat', 'TestSet3.mat','TestSet4.mat','TestSet5.mat', 'TestSet6.mat','TestSet7.mat','TestSet8.mat','TestSet9.mat'};
percentCorrect2=[];
for set=testSets
    load(set{1}); % load current test set
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
            P1=Binning(P1,180);
          result=predict(Mdl10,P1);

          if strcmp(result{1},lex(testKey))
              % Correct Prediction
              disp('correct')
              disp(result)
              disp(lex(testKey))
              disp(lex(testKey))
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
    percentCorrect2(length(percentCorrect2)+1)=numCorrect./totalNum;
    
    
end

figure(3)
startupFigure()
plot(1:length(percentCorrect2),percentCorrect2,'k.','MarkerSize',40);
title('Prediction Accuracy vs. Number of Untrained Words')
xlabel('Number of Untrained Words in Test Set')
ylabel('Classification Accuracy')
processFigure(gca,gcf,1)

cd figures
export_fig accuracyVsWords.pdf -nocrop
cd ..







