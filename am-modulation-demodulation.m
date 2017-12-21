clc;
close all;
clear all;

Fc=100;
Fs=1000*Fc;

fm=2;
Ka=0.6;

t=[0:1/Fs:0.5];

% Message Signal 
m=sin(2*pi*fm*t);

% Carrier Signal
c=sin(2*Fc*pi*t);

% Performing AM 
s=(1+Ka*m).*c;
p=s.*c;

% Performing demodulation 
[b,a]=butter(6,2*Fc/Fs,'low');

k=filter(b,a,p);

% Plotting Observations

subplot(2,2,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal m(t)');

subplot(2,2,2);
plot(t,c);
xlabel('Time');
ylabel('Amplitude');
title('Carrier wave c(t)');

subplot(2,2,3);
plot(t,s);
xlabel('Time');
ylabel('Amplitude');
title('AM modulated wave');
subplot(2,2,4);

plot(t,k);
xlabel('Time');
ylabel('Amplitude');
title('AM demodulated wave');
