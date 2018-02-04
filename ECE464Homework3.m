%% Problem 1
figure('NumberTitle', 'off', 'Name', 'Problem 1');
FuncPlottingZSystemFunction(2,[1 -1.5 -1], [1 0.9], [1 -1], [1 0.7j], [1 -0.7j])

% Get back from poles and zeros
%     [NumZ,DenZ] = zp2tf([-0.5 2 -0.9]',[0.7j -0.7j 1],1)
%     h = tf(NumZ, DenZ,-1,'variable','z^-1')
%     FuncPlottingZSystemFunction(1,NumZ,DenZ)

%% Problem 2
     [NumZ,DenZ] = zp2tf([0 2*exp(j*pi/4)]',[0.5*exp(j*pi/4)],1);
%     h = tf(NumZ, DenZ,-1,'variable','z^-1')
%     figure('NumberTitle', 'off', 'Name', 'Problem 2 a');
%     FuncPlottingZSystemFunction(1,NumZ,DenZ)
    
    
% 
%     figure('NumberTitle', 'off', 'Name', 'Problem 2 b');
%     FuncPlottingZSystemFunction(1,[0 1],[1 -0.7*exp(j*pi/4)]) 
%     
%     figure('NumberTitle', 'off', 'Name', 'Problem 2 c');
%     FuncPlottingZSystemFunction(1,[1 -(1/0.7)*exp(j*pi/4)], [1 -0.7*exp(j*pi/4)]) 
%     
    figure('NumberTitle', 'off', 'Name', 'Problem 2 d');
    FuncPlottingZSystemFunction(3, [0 -1], [0 -1], [1 -(1/0.7)*exp(j*pi/4)],[1 -0.7*exp(j*pi/4)]) 




%% Problem 3
figure('NumberTitle', 'off', 'Name', 'Problem 3');
FuncPlottingZSystemFunction(2,[0.5-0.5j -1],[0.5+0.5j -1],[1 -0.5-0.5j], [1 -0.5+0.5j])

%% Problem 4
figure('NumberTitle', 'off', 'Name', 'Problem 4');
FuncPlottingZSystemFunction(2,[1 -1],[1 2],[1 -0.8*exp(j*pi/4)], [1 -0.8*exp(-j*pi/4)])

%%

    
    h = tf([1 1 0 0] , [1 0.8*exp(-j*pi/4)],-1,'variable','z')
Numer = 1 -0.5*exp(j*pi/4)
Denom = 
    %celldisp(varargin);

%Group Delay, Freq Resp
w = linspace(-pi,pi,10000);
%[h,w] = freqz(Numer,Denom,w);
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
    %ax.YLim = [-40 40];
    ylabel('Magnitude (dB)')
    xlabel('Radian Frequency \omega')
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
    
%%

b0 = 1;
b1 = [0  1];
b2 = [1 -1.0166 1];
a1 = [1 -0.683];
a2 = [1 -1.4461 0.7957];

sos1 = [b0*[b1 0] [a1 0]]
sos2 = [b2 a2];

w = linspace(-pi,pi,10000);
h = freqz([sos1;sos2],w);
plot(w,20*log10(abs(h)))

%%


Z = {[]};
P = {0.3};
K = [1];
H = zpk(Z,P,K,-1,'Variable','z^-1')    % unspecified sample time
w = linspace(-pi,pi,10000);
h = evalfr(H,w);
h = abs(h);
plot(w,20*log10(abs(h)))