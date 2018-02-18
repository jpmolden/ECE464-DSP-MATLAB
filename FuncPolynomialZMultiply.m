function [  ] = FuncPolynomialZMultiply(varargin)
%FuncPlottingZSystemFunction Plots the freq response, group delay and pole
%   Funtion to multiply terms of a discrete time system response
%
% Example
%   FuncPolynomialZMultiply([1 -exp(-j*(pi/2))], [1 -exp(j*(pi/2))], [1 -0.5], [1 -2], [1 -1])
%   
%   context (1 - exp(-j*(pi/2))z^-1)*(1 - exp(j*(pi/2))z^-1)*(1 -0.5z^-1)*(1 -2z^-1)*(1 -z^-1)
%
%   Result: 1.0000   -3.5000    4.5000   -4.5000    3.5000   -1.0000
%   context: 1 - 3.5z^-1 + 4.5z^-2 - 4.5z^-3 + 3.5z^-4 - z^-5
% 
%   Note
%   This function will work with complex exponentials but the output will
%   be in cartesian form/real as appropriate
%   The intended use is to represent coefficients of the impulse response
%

v = size(varargin,2)

if v < 2
    display('This function needs a min of 2 inputs eg [1 -2],'/',[2 4]')
    return
end

Foil = [1];
    % Uses conv to create the polynomial numerator form
    for n = 1:size(varargin,2)
               
        Foil = conv(Foil, varargin{n});
    end
    
    
Foil