function C = cat_colors(palette,N)
%Categorical colors
%
%SYNTAX
% cat_colors(palette)
% cat_colors(palette,N)
% C = cat_colors(___)
%
%INPUTS
% palette :: {text} Name of color palette
% N :: {integer} Number of colors
%
%OUTPUTS
% C :: {N-by-3 numeric array} RGB matrix of colors
%
%
%PALETTES
% NAME        SIZE    REFERENCE
% accent       8x3    Brewer (2004)
% dark         8x3    ibid.
% paired      12x3    ibid.
% pastel       9x3    ibid.
% pastel2      8x3    ibid.
% set          9x3    ibid.
% set2         8x3    ibid.
% set3        12x3    ibid.
%
% acton      100x3    Crameri et al. (2020)
% bamako     100x3    ibid.
% batlow     100x3    ibid.
% batlowK    100x3    ibid.
% batlowW    100x3    ibid.
% bilbao     100x3    ibid.
% buda       100x3    ibid.
% davos      100x3    ibid.
% devon      100x3    ibid.
% glasgow    100x3    ibid.
% gray       100x3    ibid.
% hawaii     100x3    ibid.
% imola      100x3    ibid.
% lajolla    100x3    ibid.
% lapaz      100x3    ibid.
% lipari     100x3    ibid.
% navia      100x3    ibid.
% naviaW     100x3    ibid.
% nuuk       100x3    ibid.
% oslo       100x3    ibid.
% tokyo      100x3    ibid.
% turku      100x3    ibid.
% 
%
%EXAMPLE
% % Copy-paste this into the Command Window to view output
%  rng(8)
%  y1 = movmean(rand([1 100]),15);
%  y2 = y1 + movmean(rand([1 100]),15)./2;
%  y3 = y2 + movmean(rand([1 100]),15) - 0.2;
%  Y = [y1' y2' y3'];
%  figure(1)
%  plot(Y,'LineWidth',2)
%  C = cat_colors('dark');
%  colororder(C)
%
%
%REFERENCES
% Brewer, C. M. (2004). Colorbrewer2. https://colorbrewer2.org/
% Crameri, F., Shephard, G. E., & Heron, P. J. (2020). The misuse of colour
%   in science communication. Nature Communications, 11(1), 5444. 
%   https://doi.org/10.1038/s41467-020-19160-7
%
%See also
% cat_colorbar

arguments
 palette {mustBeText}
 N {mustBePositive, mustBeLessThan(N, 101)} = 1
end

load categorical_palettes.mat
switch palette
    % ================================================================== %
    % Brewer (2004) color palettes
    % ================================================================== %
    case 'accent'
        user_palette = categorical_palettes.accent;
    case {'dark2','dark'}
        user_palette = categorical_palettes.dark2;
    case 'paired'
        user_palette = categorical_palettes.paired;
    case {'pastel1','pastel'}
        user_palette = categorical_palettes.pastel1;
    case 'pastel2'
        user_palette = categorical_palettes.pastel2;
    case {'set1','set'}
        user_palette = categorical_palettes.set1;
    case 'set2'
        user_palette = categorical_palettes.set2;
    case 'set3'
        user_palette = categorical_palettes.set3;
    % ================================================================== %
    % Crameri et al. (2020) color palettes
    % ================================================================== %
    case {'actonS','acton'}
        user_palette = categorical_palettes.actonS;
    case {'bamakoS','bamako'}
        user_palette = categorical_palettes.bamakoS;
    case {'batlowS','batlow'}
        user_palette = categorical_palettes.batlowS;
    case {'batlowKS','batlowK'}
        user_palette = categorical_palettes.batlowKS;
    case {'batlowWS','batlowW'}
        user_palette = categorical_palettes.batlowWS;
    case {'bilbaoS','bilbao'}
        user_palette = categorical_palettes.bilbaoS;
    case {'budaS','buda'}
        user_palette = categorical_palettes.budaS;
    case {'davosS','davos'}
        user_palette = categorical_palettes.davosS;
    case {'devonS','devon'}
        user_palette = categorical_palettes.devonS;
    case {'glasgowS','glasgow'}
        user_palette = categorical_palettes.glasgowS;
    case {'grayCS','gray','grayC'}
        user_palette = categorical_palettes.grayCS;
    case {'hawaiiS','hawaii'}
        user_palette = categorical_palettes.hawaiiS;
    case {'imolaS','imola'}
        user_palette = categorical_palettes.imolaS;
    case {'lajollaS','lajolla'}
        user_palette = categorical_palettes.lajollaS;
    case {'lapazS','lapaz'}
        user_palette = categorical_palettes.lapazS;
    case {'lipariS','lipari'}
        user_palette = categorical_palettes.lipariS;
    case {'naviaS','navia'}
        user_palette = categorical_palettes.naviaS;
    case {'naviaWS','naviaW'}
        user_palette = categorical_palettes.naviaWS;
    case {'nuukS','nuuk'}
        user_palette = categorical_palettes.nuukS;
    case {'osloS','oslo'}
        user_palette = categorical_palettes.osloS;
    case {'tokyoS','tokyo'}
        user_palette = categorical_palettes.tokyoS;
    case {'turkuS','turku'}
        user_palette = categorical_palettes.turkuS;
    % ================================================================== %
    % Dracula color palette (Easter egg, not documented)
    % ================================================================== %
    case {'dracula'} % Easter egg: not documented
        user_palette = [0.5451 0.9137 0.9922;...
                        1.0000 0.7216 0.4235;...
                        0.7412 0.5765 0.9765;...
                        1.0000 0.4745 0.7765;...
                        0.3137 0.9804 0.4824;...
                        0.9451 0.9804 0.5490;...
                        1.0000 0.3333 0.3333];
    otherwise
        error('Palette not recognized.')
end
% ================================================================== %
% End switch statement
% ================================================================== %


% Set the number of colors
max_size = size(user_palette,1);
if nargin == 2
    C = return_N_colors(user_palette,N,max_size); % Local function
else
    C = user_palette;
end


end
% ================================================================== %
% End main function
% ================================================================== %

function C = return_N_colors(user_palette,N,max_size)
 if (N > max_size) || (N < 1)
   error('Invalid argument at position 2. Value must be less than %d.',max_size+1)
 end
 C = user_palette(1:N,:);
end
% ================================================================== %
% End local function
% ================================================================== %