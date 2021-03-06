%% Master Analysis
% Generation of various figures for our presentation
% @author Suyash Kumar

%% Init
clear, clc, clf;
load WordData.mat
threshold=0.35;

%% Plots

% Compares short i words to short a

shortA={'bat','pat','gap'};
shortI={'yin','din','gin'};

figure(1)

%shortA generations
for i=1:length(shortA)
    currentArray=WordMapExtended(shortA{i});
    currentData=currentArray{1};
    [P1,f]=ProcessForPrediction(currentData,threshold);
    subplot(2,3,i);
    startupFigure()
       plot(f,P1,'k-')
    title(shortA{i})
    ylabel('Power (Normalized)')
    xlabel('Frequency (Hz)')
    xlim([0,2600])
    processFigure(gca,gcf,1);
    

   
end
%shortI generations
for i=1:length(shortA)
    currentArray=WordMapExtended(shortI{i});
    currentData=currentArray{1};
    [P1,f]=ProcessForPrediction(currentData,threshold);
    subplot(2,3,i+3);
    startupFigure()
    plot(f,P1,'k-')
    ylabel('Power (Normalized)')
    xlabel('Frequency (Hz)')
    xlim([0,2600])
    title(shortI{i})
    processFigure(gca,gcf,1);
    
   
end

cd figures % Go to figured dir and export figure
export_fig comp.pdf -nocrop
cd .. % get back to root directory. 

% Make progression  figures
load WordData2.mat
WordExtraction(WordMapExtended)

cd figures % Change to Figs directory

figure(2)
startupFigure()
plot(bat1,'k')
processFigure(gca,gcf,1)
export_fig wf_1.pdf 
cd ..
figure(3)
startupFigure()
[P1_1,f]=ProcessForPrediction(bat1,0);
plot(f,P1_1,'k')
xlim([0,4000])
processFigure(gca,gcf,1)
cd figures
export_fig wf_2.pdf 
cd ..
figure(4)
startupFigure()
[P1_2,f]=ProcessForPrediction(bat1,0.35)
plot(f,P1_2,'k');
xlim([0,4000])
processFigure(gca,gcf,1)
cd figures
export_fig wf_3.pdf
cd .. 
figure(5)
startupFigure()
binnedData=Binning(P1_2,180);
stem(binnedData./max(binnedData),'k.-','MarkerSize',20,'DefaultLineWidth',20)
xlim([0,22])
processFigure(gca,gcf,1)
cd figures
export_fig wf_4.pdf 
cd ..
