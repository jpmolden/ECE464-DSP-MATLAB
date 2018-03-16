
%% Hamming
clc
clear
lowestpassingM = -1;
    
for Meven = 1:50;
    [h,w] = HamTheHam(Meven*2);
    %window h(e^jw)
        h=h.*w;  
    %Plot
    [a,b]=freqz(h);

    %Check
    Wpass_n = ceil( (0.63*pi) * (512/(2*pi)));
    Wstop_n = ceil( (0.65*pi) * (512/(2*pi)));

    if all(0.92 < (abs(a(1:Wpass_n)) < 1.02 ) == ones( size(a(1:Wpass_n),1) ,1)) & all((abs(a(Wstop_n:512)) < 0.1) == ones(size(a(Wstop_n:512),1),1))
        lowestpassingM = M;
    end
        
end




plot(b/pi,abs(a),b/pi,0*b+0.92,b/pi,0*b+0.1);