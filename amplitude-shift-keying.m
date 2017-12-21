clc;clear all;close all;

msg='abc';
y=double(msg);

tx_char=[];
dec_num=[];

for i=1:length(y)
    bit=dec2bin(y(i),8);
    tx_char=cat(2,tx_char,bit);
end

tx_bit=[str2num(tx_char(:))]';
n=length(tx_bit);

subplot(3,2,1),stem(tx_bit),ylim([‐.2 1.2]);xlabel('Time');ylabel('Amplitude');title('Message Bits');
SPB=100;
for i=1:length(tx_bit)
 wave((i‐1)*SPB+1:i*SPB)=tx_bit(i);
end

subplot(3,2,2),plot(wave),ylim([‐.2 1.2]);xlabel('Time');ylabel('Amplitude');title('Transmitted Waveform');

%Modulation
fs=1000000;
fc=50000;
t=[0:length(wave)‐1]/fs;
c=cos(2*pi*fc*t);

subplot(3,2,3),plot(t,c);ylim([‐1.5 1.5]);xlabel('Time');ylabel('Amplitude');title('Carrier');

s=wave.*c;

subplot(3,2,4),plot(t,s); ylim([‐1.5 1.5]);xlabel('Time');ylabel('Amplitude');title('Modulated Signal');

%Demodulation
x=s.*c;
cut=2*fc/fs;
[b,a]=butter(8,cut,'low');
filter_out=filter(b,a,x);
rx_wave=filter_out>.25;

subplot(3,2,5); plot(rx_wave);ylim([‐.2 1.2]);xlabel('Time');ylabel('Amplitude');title('Recieved Waveform');

z=reshape(rx_wave,SPB,[]);

w=sum(z,1);
rx_msg=w>50;

subplot(3,2,6); stem(rx_msg);ylim([‐.2 1.2]);xlabel('Time');ylabel('Amplitude');title('Received Bits');

%Processing the recieved bits

rx_binstr=[num2str(rx_msg(:))]';

for i=1:length(rx_msg)/8
 bin_char=bin2dec(rx_binstr((i‐1)*8+1:i*8));
 dec_num= cat(2,dec_num,bin_char);
end

out_str=['Received Message: ',char(dec_num)];
disp(out_str);
