%% Problem 1
fh = figure('NumberTitle', 'off', 'Name', 'Problem 1');
FuncPlottingZSystemFunction(2,[1 -1.5 -1], [1 0.9], [1 -1], [1 0.7j], [1 -0.7j])
h=get(fh,'children')
h(4).YLim = [-25 40]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.
h(3).YLim = [-8 5];

%   Children
%   4x1 Axes array:
% 
%   Axes    (\angleH(e^{j\omega}) Unwrapped Phase Response)
%   Axes    (Pole-zero Plot H(z))
%   Axes    (Group Delay)
%   Axes    (H(e^{j\omega}) dB Magnitude Response)

% Get back from poles and zeros to the system
%     [NumZ,DenZ] = zp2tf([-0.5 2 -0.9]',[0.7j -0.7j 1],1)
%     h = tf(NumZ, DenZ,-1,'variable','z^-1')
%     FuncPlottingZSystemFunction(1,NumZ,DenZ)

%% Problem 2
clear;

[NumZ,DenZ] = zp2tf([4/3]',[3/4],1);
fh = figure('NumberTitle', 'off', 'Name', 'Problem 2 a');    
FuncPlottingZSystemFunction(1,NumZ,DenZ)    
    h=get(fh,'children');
    h(4).YLim = [-10 10]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.

fh = figure('NumberTitle', 'off', 'Name', 'Problem 2 b');
FuncPlottingZSystemFunction(1,[0 1],[1 -0.7*exp(j*pi/4)]) 

fh = figure('NumberTitle', 'off', 'Name', 'Problem 2 c');
FuncPlottingZSystemFunction(1,[1 -(1/0.7)*exp(j*pi/4)], [1 -0.7*exp(j*pi/4)]) 
    h=get(fh,'children');
    h(4).YLim = [-10 10]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.


fh = figure('NumberTitle', 'off', 'Name', 'Problem 2 d');
FuncPlottingZSystemFunction(2, [1 -(1/0.7)*exp(j*pi/4)],[0 -1] ,[1 -0.7*exp(j*pi/4)])  
    h=get(fh,'children');
    h(4).YLim = [-10 10]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.

    
%% Problem 3
clear;

fh= figure('NumberTitle', 'off', 'Name', 'Problem 3');
FuncPlottingZSystemFunction(2,[(0.5-0.5j) -1],[(0.5+0.5j) -1],[1 (-0.5-0.5j)], [1 (-0.5+0.5j)])
    h=get(fh,'children');
    h(4).YLim = [-10 10]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.

fh= figure('NumberTitle', 'off', 'Name', 'Problem 3 inv');
FuncPlottingZSystemFunction(2,[1 (-0.5-0.5j)], [1 (-0.5+0.5j)],[(0.5-0.5j) -1],[(0.5+0.5j) -1])
    h=get(fh,'children');
    h(4).YLim = [-10 10]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.


%% Problem 4
clear;

fh = figure('NumberTitle', 'off', 'Name', 'Problem 4');
FuncPlottingZSystemFunction(2,[1 -1],[1 2],[1 -0.8*exp(j*pi/4)], [1 -0.8*exp(-j*pi/4)])
    h=get(fh,'children');
    h(4).YLim = [-40 20]; %Sets the subplot for magnitude to a sensable range to avoid quantization noise.
