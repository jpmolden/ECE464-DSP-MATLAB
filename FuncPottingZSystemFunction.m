function [ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Terms of the Numerator in z^-1 form, eg. [1 2] = (1+2z^-1) 
NumCoeff = 1;
NumTerm0 = [1 -1.5 -1];
NumTerm1 = [1 0.9];

%Terms of the Denom in z^-1 form, eg. [1 2] = (1+2z^-1) 
DenCoeff = 1;
DenTerm0 = [1 -1];
DenTerm1 = [1 0.7j];
DenTerm2 = [1 -0.7j];


Numer = NumCoeff*conv(NumTerm0, NumTerm1); %Conv - Polynomial Multipy e.g (1+z^-1)(1-2z^-1)
Denom = DenCoeff*conv(DenTerm2, conv(DenTerm0,DenTerm1));

[h,w] = freqz(Numer,Denom,'whole',2001);
h

plot(w/pi,20*log10(abs(h)))
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

end
