 function FuncAliasing_of_SinusiodalSignals
    clear;
    % Create a figure and axes
    f = figure('Visible','off');

   % Create slider
    sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',10,'Value',0,...
        'Position', [400 20 120 20],...
        'Callback', @plotboth); 
					
    % Add a text uicontrol to label the slider.
    txt = uicontrol('Style','text',...
        'Position',[400 45 120 20],...
        'String','--> START HERE <--');
    
    % Make figure visble after adding all components
    f.Visible = 'on';
    % This code uses dot notation to set properties. 
    % Dot notation runs in R2014b and later.
    % For R2014a and earlier: set(f,'Visible','on');


    function plotboth(source,event)
        n = linspace(0,15,16);
        w1 = pi/8; %freq 1 (rad/sample)
        z1 = exp(j*w1*n);
        plot(z1,'*')
        
        axis equal;
        title({'Illustration of how complex exp of different frequencies';'can be indistinct, w2 = (w1+2pi*m)';'z1[n] = exp(j*w1*n), z2[n] = exp(j*w2*n)'})        
        xlabel('Real')
        ylabel('Imaj')
        hold on
        
        
        m = source.Value;
        w2 = w1 + 2*pi*m;
        z2 = exp(j*w2*n);
        plot(z2,'O')
        axis equal;
        uicontrol(txt)
        formatSpec = 'm = %.4f';
        txt.String = sprintf(formatSpec,m);
        hold off
        
        %n.b round to 10 decimal points
        equal = isequal(round(z1,10), round(z2,10)); %Rounding off matlab caluculation noise
        % Calculation of a complex exp in matlab will result in small ~=*10^-14 differences in output,therefore round them off 
        switch equal
            case 0
                str0 = 'The complex exponentials at';
                str1 = sprintf('%s w1=%.4f and w2=%.4f (rad/samp) are DISTINCT',str0,w1,w2);
                disp(str1)
            case 1
                str0 = 'The complex exponentials at';
                str1 = sprintf('%s w1=%.4f and w2=%.4f (rad/samp) are THE SAME!!!',str0,w1,w2);
                disp(str1)
        end
            %assignin('base', 'z1out', z1)
            %assignin('base', 'z2out', z2)
    end
end