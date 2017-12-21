% Setting Parameters
Fm=5;
Fc=300;
Fs=5000;
t=0:1/Fs:1;
Am=1;
Ac=1.5;

% Message Signal
m=Am*sin(2*pi*Fm*t);

% Saw-tooth Signal 
r=Ac*sawtooth(2*pi*Fc*t);

% Creating PWM waveform
for i=1:length(m)
    if m(i) > r(i)
        pw(i)=1;
    else
        pw(i)=0;
    end
end

% Demodulating PWM signal
[b,a]=butter(3,2*Fm/Fs,'low');
k=filter(b,a,pw);

% Plotting waveforms
subplot(4,1,1);
plot(t,m);
title('Message Signal');
xlabel('time');
ylabel('amplitude');
subplot(4,1,2);
plot(t(1:500),r(1:500));
title('Reference Signal');
xlabel('time');
ylabel('amplitude');
subplot(4,1,3);
plot(t(1:500),pw(1:500));
ylim([‐0.1 1.1]);
title('Modulated Signal');
xlabel('time');
ylabel('amplitude');
subplot(4,1,4);
plot(t,k);
title('Demodulated Signal');
xlabel('time');
ylabel('amplitude');
