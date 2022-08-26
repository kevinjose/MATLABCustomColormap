%Creates custom colormap from specified colors. Colors can be input either
%as RBG triplet, or CSS color name (string). 
%Returns 2 objects: first is the resulting colormap object, second is the
%array of colors generated.
%This function uses 'rgb.m' and it must be in the current path.
%'rgb.m' is available on MathWorks File Exchange
%(https://www.mathworks.com/matlabcentral/fileexchange/24497-rgb-triple-of-color-name-version-2)

function [colormapObj, colorList] = colormapCustom(varargin)
    nCol = length(varargin);
    if nCol < 2
        error('Enter atleast 2 colors');
    end
    
    if exist('rgb.m', 'file') ~= 2
        error('rgb.m function missing. Available on MathWorks File Exchange (https://www.mathworks.com/matlabcentral/fileexchange/24497-rgb-triple-of-color-name-version-2)')
    end
    
    nSeg = 100;

    cols = zeros(nCol, 3);

    for i = 1:nCol
        if isequal(class(varargin{i}), 'char')
            cols(i, :) = rgb(varargin{i});
        elseif isequal(class(varargin{i}),'double')
            cols(i, :) = varargin{i};
        end
    end

    colorList = [];
    for i = 2:nCol

        temp = [linspace(cols(i-1, 1), cols(i, 1), nSeg);
            linspace(cols(i-1, 2), cols(i, 2), nSeg);
            linspace(cols(i-1, 3), cols(i, 3), nSeg);];

        if i == nCol
            colorList = [colorList, temp];
        else
            colorList = [colorList, temp(:, 1:end-1)];
        end
    end

    colorList = colorList';
    colormapObj = colormap(colorList);
end