%% Master Analysis
%  Generation of figures for our presentation
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