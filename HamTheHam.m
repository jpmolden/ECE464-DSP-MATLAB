function [ h,w ] = HamTheHam(M)
%  w=ones(M+1,1)'; %%% replace this with the actual window


%M=92; %%Some random number for order chosen. Need to replace this to meet the Spec for each window
    n=0:1:M;
    h=sin(0.64*pi*(n-M/2))./(pi*(n-M/2));
    if rem(M,2)==0
        h(M/2+1)=0.64;
    end
    
 
% create window
    w = zeros(M+1,1); %index at 1
    for i = 1:(M/2)
        w(i) = (2*n(i))/M; %%% replace this with the actual window
    end
    for i = (M/2)+1:M+1
        w(i) = 2 - (2*n(i))/M; %%% replace this with the actual window
    end
 
    w = w';
    

end

