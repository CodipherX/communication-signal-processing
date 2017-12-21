% Setting Parameters
fm=5; 
fc=500; 
fs=15*fc; 

t=0:1/fs:1; 

% Message Signal
m=square(2*pi*fm*t); 

% Carrier Signal 
c=cos(2*pi*fc*t); 

% Performing FSK modulation
intm=cumsum(m)/fs; 
kf=75; 
si=cos(2*pi*fc*t+2*pi*kf*intm); 

% Performing FSK demodulation
x=hilbert(si); 
y=x.*exp(‐1i*2*pi*fc*t); 
s=unwrap(angle(y)); 
d=[0,diff(s)*fs]; 

% Plotting waveforms
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
plot(t,si); 
title('Modulated Signal'); 
xlabel('time'); 
ylabel('amplitude'); 
subplot(4,1,4); 
plot(t,d); 
title('Demodulated Signal'); 
xlabel('time'); 
ylabel('amplitude'); 
