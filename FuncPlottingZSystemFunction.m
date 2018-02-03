function [  ] = FuncPlottingZSystemFunction(HowManyNumeratorTerms, varargin )
%FuncPlottingZSystemFunction Plots the freq response, group delay and pole
%   zero plot for a H(z) system function
%
%   Input in the form (numberOfNumeratorTerms, [num 1],...,[numN], [den1],...,[denN]) 
%
%   Example: FuncPlottingZSystemFunction(2,[1 -1.5 -1],[1 0.9],[1 -1], [1 +0.7j], [1 -0.7j])
%       This input will assume 2 numerator terms of the form:
%       (1 -1.5z^ -1z^-2)(1 0.9z^-1),
%
%       the remaining terms are assumed to be in the form
%       (1 +0.7jz^-1)(1 -0.7jz^-1)
%
%   This function takes a variable number of input args representing a H(z)
%   system
%
%   John-Paul Molden - Oregon State University


    Numer = [1];
    Denom = [1];
    n = 0;
    while n < HowManyNumeratorTerms  
            n = n + 1;
            Numer = conv(Numer, varargin{n});
    end
    %disp(Numer)
    %disp(n)
    %disp(nargin)
    while n < size(varargin,2) 
            n = n + 1;
            Denom = conv(Denom, varargin{n});
            %disp(Denom);
    end
    
    h = tf(Numer, Denom,-1,'variable','z^-1')
    %disp(Numer)
    %disp(Denom)
    %celldisp(varargin);

%Group Delay, Freq Resp
w = linspace(-pi,pi,10000);
[h,w] = freqz(Numer,Denom,w);
gd = grpdelay(Numer,Denom,w);


%Graph Stuff 
subplot(2,2,1)
plot(w,20*log10(abs(h)))
% [Peak, PeakIdx] = findpeaks(w,20*log10(abs(h)));
% findpeaks(w,20*log10(abs(h)));
% text(Resistance(PeakIdx), Peak, sprintf('Peak = %6.3f (mW)', Peak))
% 
    title('H(e^{j\omega}) dB Magnitude Response')
    ax = gca;
    ax.XLim = [-pi pi];
    ax.YLim = [-40 40];
    ylabel('Magnitude (dB)')
    xlabel('Radian Frequency \omega')
    set(gca,'XTick',-pi:pi/2:pi) 
    set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','pi'}) 

subplot(2,2,2)
plot(w,gd)
    title('Group Delay')
    ax = gca;
    ax.XLim = [-pi pi];
    ylabel('Samples')
    xlabel('Radian Frequency \omega')
    set(gca,'XTick',-pi:pi/2:pi) 
    set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','pi'}) 

subplot(2,2,3)
    zplane(Numer,Denom)
    title('Pole-zero Plot H(z)')
    ax = gca;
    xlabel('Re(z)')
    ylabel('Im(z)')
    
end

