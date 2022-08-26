# MATLABCustomColormap
Simple function to create custom colormap in MATLAB using RGB triplets or CSS color names.

Creates custom colormap from specified colors. Colors can be input either as RBG triplet, or CSS color name (string). Returns 2 objects: first is the resulting colormap object, second is the array of colors generated. 

EXAMPLE USAGE
```
colormapCustom('darkred', 'white', 'navy')

[colormapObj, colorList] = colormapCustom([1 0 0], 'white', 'navy', [1 1 1])

colormapObj = colormapCustom([1 0 0], [0.5 0.5 0.5])
```

## Note
This function uses `rgb.m` and it must be in the current path.
`rgb.m` is available on MathWorks File Exchange (https://www.mathworks.com/matlabcentral/fileexchange/24497-rgb-triple-of-color-name-version-2)
