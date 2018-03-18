%% HW8 - Applying windowing to an impulse response of a DT filter
% Oregon State ECE464 - Digial Signal Processing
% by John-Paul Molden

%% Common Variables %%
close all
clear
clc

%Passband Magnitude Limits and Frequency
PBMagLowerLimit = 0.92;
PBMagUpperLimit = 1.02;
PBOmegaLower = 0;
PBOmegaUpper = 0.63*pi;

%Stopband Magnitude Limits and Frequency
SBMagUpperLimit = 0.1;
SBMagLowerLimit = 0; %Redundant since magnitude >0
SBOmegaLower = 0.65*pi;
SBOmegaUpper = 1*pi;




%% Triangle %%
clc
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

        %Find the indexes in b where the pass/stop band ends/begins
        PassbandIndexMax = find(b > (PBOmegaUpper),1) - 1;
        StopbandIndexMin = find(b > (SBOmegaLower),1) - 1;
        
        %check if the output meets the required specs for pass band/stop band
        if (all(PBMagLowerLimit < (abs(a(1:PassbandIndexMax)) < PBMagUpperLimit) == ones(size(a(1:PassbandIndexMax),1) ,1)) & ...
            all((abs(a(StopbandIndexMin:512)) < SBMagUpperLimit) == ones(size(a(StopbandIndexMin:512),1),1)) & ...
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
line([PBOmegaUpper/pi PBOmegaUpper/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([SBOmegaLower/pi SBOmegaLower/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])



%% Hamming %%
clc
lowestpassingM = -1;
M = 1;
window = 'Hamming';

%Find a value for M that passes the spec
    while (lowestpassingM == -1) && (M < 400)
        M = M + 1;
        [h,w] = FuncCreatewindow(M ,window);
        %window h(e^jw)
            h=h.*w;  
        %Plot
        [a,b]=freqz(h);

        %Find the indexes in b where the pass/stop band ends/begins
        PassbandIndexMax = find(b > (PBOmegaUpper),1) - 1;
        StopbandIndexMin = find(b > (SBOmegaLower),1) - 1;
        
        %check if the output meets the required specs for pass band/stop band
        if (all(PBMagLowerLimit < (abs(a(1:PassbandIndexMax)) < PBMagUpperLimit) == ones(size(a(1:PassbandIndexMax),1) ,1)) & ...
            all((abs(a(StopbandIndexMin:512)) < SBMagUpperLimit) == ones(size(a(StopbandIndexMin:512),1),1)) & ...
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
line([PBOmegaUpper/pi PBOmegaUpper/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([SBOmegaLower/pi SBOmegaLower/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])



%% Hann %%
clc
lowestpassingM = -1;
M = 1;
window = 'Hann';

%Find a value for M that passes the spec
    while (lowestpassingM == -1) && (M < 400)
        M = M + 1;
        [h,w] = FuncCreatewindow(M ,window);
        %window h(e^jw)
            h=h.*w;  
        %Plot
        [a,b]=freqz(h);

        %Find the indexes in b where the pass/stop band ends/begins
        PassbandIndexMax = find(b > (PBOmegaUpper),1) - 1;
        StopbandIndexMin = find(b > (SBOmegaLower),1) - 1;
        
        %check if the output meets the required specs for pass band/stop band
        if (all(PBMagLowerLimit < (abs(a(1:PassbandIndexMax)) < PBMagUpperLimit) == ones(size(a(1:PassbandIndexMax),1) ,1)) & ...
            all((abs(a(StopbandIndexMin:512)) < SBMagUpperLimit) == ones(size(a(StopbandIndexMin:512),1),1)) & ...
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
line([PBOmegaUpper/pi PBOmegaUpper/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([SBOmegaLower/pi SBOmegaLower/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])



%% Blackman %%
clc
lowestpassingM = -1;
M = 1;
window = 'Blackman';

%Find a value for M that passes the spec
    while (lowestpassingM == -1) && (M < 400)
        M = M + 1;
        [h,w] = FuncCreatewindow(M ,window);
        %window h(e^jw)
            h=h.*w;  
        %Plot
        [a,b]=freqz(h);

        %Find the indexes in b where the pass/stop band ends/begins
        PassbandIndexMax = find(b > (PBOmegaUpper),1) - 1;
        StopbandIndexMin = find(b > (SBOmegaLower),1) - 1;
        
        %check if the output meets the required specs for pass band/stop band
        if (all(PBMagLowerLimit < (abs(a(1:PassbandIndexMax)) < PBMagUpperLimit) == ones(size(a(1:PassbandIndexMax),1) ,1)) & ...
            all((abs(a(StopbandIndexMin:512)) < SBMagUpperLimit) == ones(size(a(StopbandIndexMin:512),1),1)) & ...
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
line([PBOmegaUpper/pi PBOmegaUpper/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
line([SBOmegaLower/pi SBOmegaLower/pi], get(gca, 'ylim'), 'LineWidth',1,'LineStyle', ':');
title(['|H(e^{j\omega})| for a ' window ' Windowed FIR filter order M = ' num2str(M) ''])

%%
clear
clc


load('HW8_Bonus.mat');
% sound(noised_audio,fs)
Wp=2*pi*6600;
Ws=2*pi*8800;
Rp=0.5;
Rs=-50;


[N,Wp]=cheb1ord(Wp,Ws,Rp,Rs,'s');
[b,a]=cheby1(N,Rp,Wp,'low','s');
[bz,az]=bilinear(b,a,fs);

filtered_sound=filter(bz,az,noised_audio);
sound(filtered_sound,fs);



figure(1)
freqs(b,a,1000);
figure(2)
freqz(bz,az,1000);
figure(3)
subplot(121)
plot(noised_audio)
title('noisy audio')
subplot(122)
plot(filtered_sound)
title('noise free data')

