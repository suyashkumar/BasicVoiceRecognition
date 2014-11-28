function [ ] = processFigure( gca, gcf, whiteBkg)

if whiteBkg
    set(gcf, 'Color', 'w');
end
set(gca, 'box','off');
set(gca,'FontSize',14)
end

