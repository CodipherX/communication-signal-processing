% Setting Parameters
Fs=8000;
fm=2;
t=[0:1/Fs:4];

% Sine wave
y1=sin(2*pi*fm*t);

% Square wave
y2=square(2*pi*fm*t);

% Exponential wave
y3=exp(2*pi*fm*t);

%Exponentially decaying wave
y4=exp(-2*t).*y1;

% Sawtooth Wave
y5=sawtooth(20.*t,0.5);

n=[-5:5];
no=0;

% Unit impulse function
u=[(n-no)==0];

% Unit step function
u1=[(n-no)>=0];

% Plotting results
subplot(4,2,1);
plot(t,y1);
xlabel('Time');
ylabel('Amplitude');
title('Sine wave');
subplot(4,2,2);
plot(t,y2);
xlabel('Time');
ylabel('Amplitude');
title('Square wave');
subplot(4,2,3);
plot(t,y3);
xlabel('Time');
ylabel('Amplitude');
title('Exp wave');
subplot(4,2,4);
plot(t,y4);
xlabel('Time');
ylabel('Amplitude');
title('Damping wave');
subplot(4,2,5);
plot(t,y5);
xlabel('Time');
ylabel('Amplitude');
title('Triangular wave');
subplot(4,2,6);
stem(n,u);
xlabel('Time');
ylabel('Amplitude');
title('Unit impulse');
subplot(4,2,7);
stem(n,u1);
xlabel('Time');
ylabel('Amplitude');
title('Unit step');
