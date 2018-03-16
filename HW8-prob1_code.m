M=92; %%Some random number for order chosen. Need to replace this to meet the Spec for each window
n=0:1:M;
h=sin(0.64*pi*(n-M/2))./(pi*(n-M/2));
if rem(M,2)==0
    h(M/2+1)=0.64;
end'
w=ones(M+1,1)'; %%% replace this with the actual window
h=h.*w;
[a,b]=freqz(h);
plot(b/pi,abs(a),b/pi,0*b+0.95,b/pi,0*b+0.15);