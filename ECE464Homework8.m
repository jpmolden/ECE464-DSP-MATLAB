close all
clear
clc

%% Triangle
clc
clear
lowestpassingM = -1;
M = 0;

window = 'Triangle';
%Find a value for M that passes the spec
    while (lowestpassingM == -1) && (M < 400)
        M = M + 2;
        [h,w] = FuncCreatewindow(M ,window);
        %window h(e^jw)
            h=h.*w;  
        %Plot
        [a,b]=freqz(h);

        %Check
        Wpass_n = ceil( (0.63*pi) * (512/(pi)));
        Wstop_n = ceil( (0.65*pi) * (512/(pi)));

        %check if the output meets the required specs for pass band/stop band
        if (all(0.92 < (abs(a(1:Wpass_n)) < 1.02 ) == ones( size(a(1:Wpass_n),1) ,1)) & ...
            all((abs(a(Wstop_n:512)) < 0.1) == ones(size(a(Wstop_n:512),1),1)) & ...
            lowestpassingM == -1)
                %value where M passes
                lowestpassingM = (M);
        end        
    end

%Create the plot figure
subplot(2,2,1)
plot(b/pi,abs(a),b/pi,0*b+0.92,b/pi,0*b+0.1);
ax = gca;
ax.YLim = [0 1.1];
line([0.63 0.63], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([0.65 0.65], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])





%% Hamming
clc
clear
lowestpassingM = -1;
M = 0;

window = 'Hamming';
%Find a value for M that passes the spec
    while (lowestpassingM == -1) && (M < 400)
        M = M + 2;
        [h,w] = FuncCreatewindow(M ,window);
        %window h(e^jw)
            h=h.*w;  
        %Plot
        [a,b]=freqz(h);

        %Check
        Wpass_n = ceil( (0.63*pi) * (512/(pi)));
        Wstop_n = ceil( (0.65*pi) * (512/(pi)));

        %check if the output meets the required specs for pass band/stop band
        if (all(0.92 < (abs(a(1:Wpass_n)) < 1.02 ) == ones( size(a(1:Wpass_n),1) ,1)) & ...
            all((abs(a(Wstop_n:512)) < 0.1) == ones(size(a(Wstop_n:512),1),1)) & ...
            lowestpassingM == -1)
                %value where M passes
                lowestpassingM = (M);
        end        
    end

%Create the plot figure
subplot(2,2,2)
plot(b/pi,abs(a),b/pi,0*b+0.92,b/pi,0*b+0.1);
ax = gca;
ax.YLim = [0 1.1];
line([0.63 0.63], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([0.65 0.65], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])


%% Hann
clc
clear
lowestpassingM = -1;
M = 0;

window = 'Hann';
%Find a value for M that passes the spec
    while (lowestpassingM == -1) && (M < 400)
        M = M + 2;
        [h,w] = FuncCreatewindow(M ,window);
        %window h(e^jw)
            h=h.*w;  
        %Plot
        [a,b]=freqz(h);

        %Check
        Wpass_n = ceil( (0.63*pi) * (512/(pi)));
        Wstop_n = ceil( (0.65*pi) * (512/(pi)));

        %check if the output meets the required specs for pass band/stop band
        if (all(0.92 < (abs(a(1:Wpass_n)) < 1.02 ) == ones( size(a(1:Wpass_n),1) ,1)) & ...
            all((abs(a(Wstop_n:512)) < 0.1) == ones(size(a(Wstop_n:512),1),1)) & ...
            lowestpassingM == -1)
                %value where M passes
                lowestpassingM = (M);
        end        
    end

%Create the plot figure
subplot(2,2,3)
plot(b/pi,abs(a),b/pi,0*b+0.92,b/pi,0*b+0.1);
ax = gca;
ax.YLim = [0 1.1];
line([0.63 0.63], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([0.65 0.65], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])


%% Blackman
clc
clear
lowestpassingM = -1;
M = 0;

window = 'Blackman';
%Find a value for M that passes the spec
    while (lowestpassingM == -1) && (M < 400)
        M = M + 2;
        [h,w] = FuncCreatewindow(M ,window);
        %window h(e^jw)
            h=h.*w;  
        %Plot
        [a,b]=freqz(h);

        %Check
        Wpass_n = ceil( (0.63*pi) * (512/(pi)));
        Wstop_n = ceil( (0.65*pi) * (512/(pi)));

        %check if the output meets the required specs for pass band/stop band
        if (all(0.92 < (abs(a(1:Wpass_n)) < 1.02 ) == ones( size(a(1:Wpass_n),1) ,1)) & ...
            all((abs(a(Wstop_n:512)) < 0.1) == ones(size(a(Wstop_n:512),1),1)) & ...
            lowestpassingM == -1)
                %value where M passes
                lowestpassingM = (M);
        end        
    end

%Create the plot figure
subplot(2,2,4)
plot(b/pi,abs(a),b/pi,0*b+0.92,b/pi,0*b+0.1);
ax = gca;
ax.YLim = [0 1.1];
line([0.63 0.63], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([0.65 0.65], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])





%%

