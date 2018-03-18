function [ h,w ] = FuncCreatewindow(M,windowType)
%FuncCreatewindow Applies a window to the function h
%   TODO: Description
%   
%
%    
%
%   
%
%   John-Paul Molden ECE464/564: Digital Signal Processing - Oregon State University   


%M=92; %%Some random number for order chosen. Need to replace this to meet the Spec for each window
    n=0:1:M;
    h=sin(0.64*pi*(n-M/2))./(pi*(n-M/2));
    if rem(M,2)==0
        h(M/2+1)=0.64;
    end
    
 
% create window
switch windowType
    case 'Triangle'
        w = zeros(M+1,1); %index at 1
      
        for i = 1:(M/2)
            w(i) = (2*n(i))/M; 
        end
        for i = (M/2)+1:M+1
            w(i) = 2 - (2*n(i))/M; 
        end
        w = w';
   
    case 'Hann'
        n = (0:1:M);
        w = 0.5 - 0.5*cos((2*pi*n)/(M)); 

    case 'Hamming'
        n = (0:1:M);
        w = 0.54 - 0.46*cos((2*pi*n)/(M)); 

        
    case 'Blackman'
        n = (0:1:M);
        w = 0.42 - 0.5*cos((2*pi*n)/(M)) + 0.08*cos((4*pi*n)/(M));       

    otherwise
        disp('Invalid Window')
              
end %End switch


end

