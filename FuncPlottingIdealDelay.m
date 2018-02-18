% John-Paul Molden ECE464/564: Digital Signal Processing - Oregon State University   

function FuncPlottingIdealDelay
%FuncPlottingIdealDelay Plots the impulse response of an ideal delay system
%   zero plot for a H(z) system function

    clear;
    % Create a figure and axes
    f = figure('Visible','off');

   % Create slider
   % The slider uses a callback to plot to replot the graph
    sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',10,'Value',0,...
        'Position', [400 20 120 20],...
        'Callback', @plot);
    
    % Add a text uicontrol to label the slider.
    txt1 = uicontrol('Style','text',...
        'Position',[400 45 120 20],...
        'String','--> START HERE <--');
    
    % Make figure visble after adding all components
    f.Visible = 'on';
    
    function plot(source,event)
        n = -10:1:10;
        a = source.Value;
        h = (sinc(n - a)); %Defined as sin(pi*x)/(pi*x)
        source.Value;
        stem(n,h)
        ax = gca;
        ax.YLim = [-1 1];
        title({'The impulse response of H_{id}(e^{-j\omega\alpha})';'Result is a \delta[n - \alpha_{n}] for integer \alpha';'Or a sinc[n - \alpha] O.W'})
        uicontrol(txt1)
        formatSpec = 'a = %.4f';
        txt1.String = sprintf(formatSpec,a);
        
    end
end