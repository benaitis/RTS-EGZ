% Benas Zabita 20162566
% 1. Sukurkite signalą iš vienodos amplitudės 566, 2066, 5660 ir 6606 Hz harmoninių virpesių.
% 2. Sukurkite FIR filtrą, kuris iki 566 Hz signalą slopintų 1 dB ribose ir nuo 5660 Hz signalą blokuotų ties 86 dB riba.
% 3. Čia XX - paskutiniai stud. knygelės Nr. du skaičiai, Y - paskutinis stud. knygelės Nr. skaičius.
% 4. Sukurkite IIR filtrą su tomis pačiomis dažininėmis ir amplitudėmis charakteristikomis.

% Part 1
%Generator of 566Hz, 2066Hz, 5660Hz, 6606Hz signals
%Sample frequency
Fs = 96000; % 16980; %Hz % 96000
%Sample time
T=1/Fs;

%Number of samples
Length = 300;
%Time samples
t=(0:Length-1)*T;

%Signal formation
% 0.5 reikia nereikia?
Signal=sin(2*pi*566*t)+sin(2*pi*2066*t)+sin(2*pi*5660*t)+sin(2*pi*6606*t);

%Plot signal
subplot(3, 2, 1);
plot(t, Signal);
xlabel('Time (Length / Fs) , s');
ylabel('Amplitude');
title('Sum of harmonics')

%Spectrum
Y=fft(Signal);

%Separate sides
P2 = abs(Y/Length);
P1 = P2(1:Length/4+1);
P1(2:end-1) = 2*P1(2:end-1);

%Plot spectrum
f = Fs*(0:(Length/4))/Length;
subplot(3,2,2);
plot(f,P1) 
title('Single-Sided Amplitude Spectrum')
xlabel('f, Hz')
ylabel('P')

% Part 2
% 2. Sukurkite FIR filtrą, kuris iki 566 Hz signalą slopintų 1 dB ribose ir nuo 5660 Hz signalą blokuotų ties 86 dB riba.
%Filter the signal
tic
signal_filtered_fir = filter(fir_filter,Signal);
toc

%Plot filtered signal
subplot(3,2,3);
plot(t, signal_filtered_fir);
xlabel('Time (Length / Fs) , s');
ylabel('Amplitude');
title('Filtered signal using FIR')

%Spectrum of filtered signal
Y=fft(signal_filtered_fir);

%Separate sides
P2 = abs(Y/Length);
P1 = P2(1:Length/4+1);
P1(2:end-1) = 2*P1(2:end-1);

%Plot spectrum of filtered signal
f = Fs*(0:(Length/4))/Length;
subplot(3,2,4);
plot(f,P1)
title('Single-Sided Amplitude Spectrum of the filtered signal using FIR')
xlabel('f, Hz')
ylabel('P')

% 4. Sukurkite IIR filtrą su tomis pačiomis dažininėmis ir amplitudėmis charakteristikomis.
tic
signal_filtered_iir = filter(iir_filter,Signal);
toc

%Plot filtered signal
subplot(3,2,5);
plot(t, signal_filtered_iir);
xlabel('Time (Length / Fs) , s');
ylabel('Amplitude');
title('Filtered signal using IIR ')

%Spectrum of filtered signal
Y=fft(signal_filtered_iir);

%Separate sides
P2 = abs(Y/Length);
P1 = P2(1:Length/4+1);
P1(2:end-1) = 2*P1(2:end-1);

%Plot spectrum of filtered signal
f = Fs*(0:(Length/4))/Length;
subplot(3,2,6);
plot(f,P1)
title('Single-Sided Amplitude Spectrum of the filtered signal using IIR')
xlabel('f, Hz')
ylabel('P')
