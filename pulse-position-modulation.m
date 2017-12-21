% Pulse Position Modulation
clc; clear all; close all;

Fs = 1e6;
t = [0:Fs]/Fs;

% Message Signal
Am = 5; fm = 200;
m = Am*sin(2*pi*fm*t);

subplot 321; plot(t(1:10000),m(1:10000)); title('Message Signal'); xlabel('Time'); ylabel('Amplitude'); ylim([‐5.5 5.5]); grid on;

% Reference Signal
Ac = 7; fc = 2000;
ref = Ac*sawtooth(2*pi*fc*t);

subplot 323; plot(t(1:10000),ref(1:10000)); title('Reference Signal'); xlabel('Time'); ylabel('Amplitude'); ylim([‐7.7 7.7]); grid on;

% PWM Modulation
for i = 1:length(t)
    if m(i) > ref(i)
        pwm(i) = 1;
    else
        pwm(i) = 0;
    end
end

subplot 325; plot(t(1:10000),pwm(1:10000)); title('PWM Signal'); xlabel('Time'); ylabel('Amplitude'); ylim([‐0.2 1.2]); grid on;

% Inverter Block
inverted_wave = 1 ‐ pwm;

% Differentiation Block
Diff_wave = [0,diff(inverted_wave)];

subplot 322; plot(t(1:5000),Diff_wave(1:5000)); title('Inverted & Diff Signal'); xlabel('Time'); ylabel('Amplitude'); ylim([‐1.2 1.2]); grid on;

% +ve edge Triggered wave Generator
for i = 1:length(t)
    if Diff_wave(i) == 1
        ppm(i:i+200) = 1;
    end
end

subplot 324; plot(t(1:5000),ppm(1:5000)); title('PPM Signal'); xlabel('Time'); ylabel('Amplitude'); ylim([‐0.2 1.2]); grid on;

% PPM Demodulation
[b,a] = butter(3,2*fm/Fs,'low');
demod_m = 5*(filter(b,a,pwm));
subplot 326; plot(t(1:10000),demod_m(1:10000)); title('Demodulated Signal'); xlabel('Time'); ylabel('Amplitude');  grid on;
