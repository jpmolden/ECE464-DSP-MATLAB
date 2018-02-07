% John-Paul Molden ECE464/564: Digital Signal Processing - Oregon State University   

function [  ] = FuncPlottingZSystemFunction(varargin )
%FuncPlottingZSystemFunction Plots the freq response, group delay and pole
%   zero plot for a H(z) system function
%
%   Input in the form ([num 1],...,[numN],'/', [den1],...,[denN]) 
%
%   Example: FuncPlottingZSystemFunction([1 -1.5 -1],[1 0.9],'/',[1 -1], [1 +0.7j], [1 -0.7j])
%       This input will assume 2 numerator terms of the form:
%       (1 -1.5z^ -1z^-2)(1 0.9z^-1),
%
%       the remaining terms are assumed to be in the form
%       (1 +0.7jz^-1)(1 -0.7jz^-1).
%
%   This function takes a variable number of input args representing a H(z)
%   system
%
%   John-Paul Molden ECE464/564: Digital Signal Processing - Oregon State University   
    
v = size(varargin,2)

if size(varargin,2) < 2
    display('This function needs a min of 3 inputs eg [1 -2],'/',[2 4]')
    return
end


    HowManyNumeratorTerms = 0;
    for n = 1:size(varargin,2)
            if varargin{n} == '/'
                HowManyNumeratorTerms = n-1;
                display(HowManyNumeratorTerms)
            end
    end

    Numer = [1];
    Denom = [1];
    
    % Uses conv to create the polynomial numerator form
    for n = 1:HowManyNumeratorTerms
               
        Numer = conv(Numer, varargin{n});
    end
    
    
    for n = (HowManyNumeratorTerms + 2):size(varargin,2)
                
        Denom = conv(Denom, varargin{n});
    end
    
    
    
    % Displays the transfer function
    h = tf(Numer, Denom,-1,'variable','z^-1')
    
%Group Delay, Freq Resp
    w = linspace(-pi,pi,10000); %Create radian frequency vector with 10000 evenly spaced points
    [h,w] = freqz(Numer,Denom,w); %Calculate the frequency response
    gd = grpdelay(Numer,Denom,w); %Calculate group delay response
    phi = phasez(Numer,Denom,w);  %Calculate the phase response


%Graph Stuff 
% This section plots the freq, phase, group delay and pole-zero plots in a
% 2x2 grid

subplot(2,2,1)
    plot(w,20*log10(abs(h)))
    title('H(e^{j\omega}) dB Magnitude Response')
    ax = gca;
    ax.XLim = [-pi pi];
    %ax.YLim = [-40 40];
    ylabel('Magnitude (dB)')
    xlabel('Radian Frequency \omega')
    %Set the x-axis marks in pi terms like the book
    set(gca,'XTick',-pi:pi/2:pi) 
    set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'}) 

subplot(2,2,2)
    plot(w,gd)
        title('Group Delay')
        ax = gca;
        ax.XLim = [-pi pi];
        ylabel('Samples')
        xlabel('Radian Frequency \omega')
        set(gca,'XTick',-pi:pi/2:pi) 
        set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'}) 

subplot(2,2,3)
    zplane(Numer,Denom)
        title('Pole-zero Plot H(z)')
        ax = gca;
        xlabel('Re(z)')
        ylabel('Im(z)')

subplot(2,2,4)
    plot(w,phi)
        title('\angleH(e^{j\omega}) Unwrapped Phase Response')
        ax = gca;
        ax.XLim = [-pi pi];
        ylabel('Radians')
        xlabel('Radian Frequency \omega')
        set(gca,'XTick',-pi:pi/2:pi) 
        set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'}) 

end

