% Setting Parameters
fm=5; 
fc=500; 
fs=15*fc; 

t=0:1/fs:0.5; 

% Message Signal
m=sin(2*pi*fm*t);

% Carrier Signal 
c=cos(2*pi*fc*t); 

% Performing DSB-SC modulation
s=m.*c; 

% Plotting modulation output
subplot(4,1,1); 
plot(t,m); 
title('Message Signal'); 
xlabel('time'); 
ylabel('amplitude'); 
subplot(4,1,2); 
plot(t,c); 
title('Carrier Signal'); 
xlabel('time'); 
ylabel('amplitude'); 
subplot(4,1,3); 
plot(t,s); 
title('Modulated Signal'); 
xlabel('time'); 
ylabel('amplitude'); 

% Performing DSB-SC demodulation
d=s.*c; 
[b,a]=butter(6,2*fc/fs,'low'); 
k=2*filter(b,a,d); 

% Plotting demodulated waveforms
subplot(4,1,4); 
plot(t,k); 
title('Demodulated Signal'); 
xlabel('time'); 
ylabel('amplitude'); 
