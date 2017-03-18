close all; clear all;
%This program performs the filtering on the ECG signal of 100Hz and display
%the pre and post filtering ECG signal in time and frequency domain

load('F:\IU Teaching\2016-Fall_HK1\BioSignal\Trung Le Lab\LabExample\ECG_100HzSamplingRate.mat'); %Change to the folder you save the ECG signal
ecg= val;
Fs = 100; %Sampling frequency 100Hz
l =1:1:length(ecg);
time = l/Fs; %Cycle
figure ('Name','ECG signal'); %Create a figure
plot(time,ecg);
xlabel('Time (second)'); ylabel('Amp. (uV)');
grid on;
%% Fast fourier transform

figure('Name','Fast Fourier Transform'),
fecg=fft(ecg);  %Fast fourier transformation
flength = l/Fs;
plot(Fs/length(fecg):Fs/length(fecg):Fs,abs(fecg));
xlabel('Freq (Hz)'); ylabel('Gain');
grid on;

%% Filter design

b=fir1(34,0.3,'high',hamming(35)); %Filter design order of 34, cut of freq of 0.3*Fs/2 Cheb window)
figure('Name','Frequency Response');
freqz(b,1,512); %Frequency response
filteredecg= conv(b,ecg); % Filter the signal
figure ('Name','Filtered ECG'), plot(1/Fs:1/Fs:length(filteredecg)/Fs,filteredecg);
grid on;xlabel('Time (second)'); 
ylabel('Amp. (uV)');
figure ('Name','FFT Filtered ECG Signal'),
plot(Fs/length(filteredecg):Fs/length(filteredecg):Fs,abs(fft(filteredecg)));
grid on;xlabel('Freq (Hz)'); ylabel('Gain');


