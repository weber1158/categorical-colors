function cb = cat_colorbar(C,labels,order)
%Categorical colorbar
%
%SYNTAX
% cat_colorbar(C)
% cat_colorbar(C,labels)
% cat_colorbar(C,labels,order)
% cb = cat_colorbar(___)
%
%INPUTS
% C :: {N-by-3 numeric array} RGB matrix of categorical colors
% labels :: {text} List of names corresponding to each color
% order :: {logical} Colorbar order (set to false to flip the colorbar)
%
%OUTPUTS
% cb :: {colorbar} Handle to colorbar object
%
%See also
% cat_colors

arguments
 C {mustBeMatrix, mustBeNumeric}
 labels {mustBeText}
 order {mustBeNumericOrLogical} = true
end

truncated_C = C(1:numel(labels),:);
if order == true
    truncated_C = flipud(truncated_C);
    labels = flip(labels);
end

% Add a color bar to the current chart

colormap(gca,truncated_C);
cb=colorbar;

% Center the tick positions about each color
tickPositions = linspace(0,1,size(truncated_C,1)*2+1);
tickPositions(1:2:numel(tickPositions)) = [];
cb.Ticks = tickPositions;

% Remove tick marks
cb.TickDirection = 'none';

% Add labels
cb.TickLabels = labels;

end