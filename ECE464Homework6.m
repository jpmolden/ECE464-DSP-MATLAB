% ECE 464 HW 6
%% Problem 1
clear;
fh = figure('NumberTitle', 'off', 'Name', 'HW 6 Problem 1');
FuncPlottingZSystemFunction([-1/4 0 1],'/',[1 0 -1/4])
h=get(fh,'children')
    % For reference, figure children
    % h = 
    % 
    %   4x1 Axes array:
    % 
    %   Axes    (\angleH(e^{j\omega}) Wrapped Phase Response)
    %   Axes    (Pole-zero Plot H(z))
    %   Axes    (Group Delay)
    %   Axes    (H(e^{j\omega}) dB Magnitude Response)
h(4).YLim = [-10 10]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.

%% Problem 2
fh = figure('NumberTitle', 'off', 'Name', 'HW 6 Problem 2');
FuncPlottingZSystemFunction([1 -3],'/',[1 -1])


