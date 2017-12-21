% Setting Parameters
Fm=5;
Fc=500;
Fs=5000;
t=0:1/Fs:1;
Am=1;
Ac=1;

% Message Signal
m=Am*square(2*pi*Fm*t);

% Carrier Signal 
c=Ac*cos(2*pi*Fc*t);

Kp=1;

% Performing PSK modulation
s=Ac*cos(2*pi*Fc*t+Kp*m);

% Performing PSK demodulation
x=hilbert(s);
y=x.*exp(‐1i*2*pi*Fc*t);
z=unwrap(angle(y));
d=z/Kp;

% Plotting waveforms
subplot(4,1,1);
plot(t,m);
title('Message Signal');
xlabel('time');
ylabel('amplitude');
ylim([‐2,2]);
subplot(4,1,2);
plot(t(1:1000),c(1:1000));
title('Carrier Signal');
xlabel('time');
ylabel('amplitude');
subplot(4,1,3);
plot(t(1:1000),s(1:1000));
title('Modulated Signal');
xlabel('time');
ylabel('amplitude');
subplot(4,1,4);
plot(t,d);
title('Demodulated Signal');
xlabel('time');
ylabel('amplitude');