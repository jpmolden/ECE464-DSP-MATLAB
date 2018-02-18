% 
%% Problem 2

fh = figure('NumberTitle', 'off', 'Name', 'Problem 2 a - System');
FuncPlottingZSystemFunction([1 0 -16],[1 0.3], '/' ,[1 0 0.64]) 



%% Problem 3

fh = figure('NumberTitle', 'off', 'Name', 'Problem 3a - System');
FuncPlottingZSystemFunction([1 -4],[1 -0.6], '/' ,[1 -0.25]) 

%% Problem 

fh = figure('NumberTitle', 'off', 'Name', 'Problem  - System');
FuncPlottingZSystemFunction([1 -2], '/' ,[1 -0.5]) 

fh = figure('NumberTitle', 'off', 'Name', 'Problem  - System');
FuncPlottingZSystemFunction([-2],[-1/2 1], '/' ,[1 -0.5]) 

%% Problem 

fh = figure('NumberTitle', 'off', 'Name', 'Problem  - System');
FuncPlottingZSystemFunction([(2/3)*exp(-j*(pi/4)) 1],[(2/3)*exp(j*(pi/4)) 1] ,'/', [1 (2/3)*exp(j*(pi/4))],[1 (2/3)*exp(-j*(pi/4))]) 


%% Problem 
fh = figure('NumberTitle', 'off', 'Name', 'Problem  - System1');
FuncPlottingZSystemFunction([2*exp(-j*0)], [-1/2 1], '/' ,[2], [1 -1/2]) 

fh = figure('NumberTitle', 'off', 'Name', 'Problem  - System2');
FuncPlottingZSystemFunction([2*exp(-j*pi)], [-1/2 1], '/' ,[2], [1 -1/2]) 

%% Problem 4
fh = figure('NumberTitle', 'off', 'Name', 'Problem 4  - System1');
FuncPlottingZSystemFunction([2*exp(-j*pi)], [0 0 -0.5 1], '/', [2], [1 -0.5]) 

fh = figure('NumberTitle', 'off', 'Name', 'Problem 4 orig  - System1');
FuncPlottingZSystemFunction([1 -2], [0 0 1], '/', [2], [1 -0.5])


%% Problem 4
fh = figure('NumberTitle', 'off', 'Name', 'Problem 4  - System1');
FuncPlottingZSystemFunction([1 2], '/', [1]) 


%% Problem 3
fh = figure('NumberTitle', 'off', 'Name', 'Problem 4  - System1');
FuncPlottingZSystemFunction([-1/4 1], '/', [1], [1 -1/4]) 
