clear; clc; close all;

A = 1;
Rs = 100;
T = 1 / Rs;
Fs = 10000;
Tb = T;
N = 100;
t = 0:1/Fs:N*Tb - 1/Fs;

bits = randi([0 1], 1, N);

a_t = repelem(bits, Fs*Tb) * A;

nfft = 2^nextpow2(length(a_t));
A_f = fftshift(abs(fft(a_t, nfft)));

f = linspace(-Fs/2, Fs/2, nfft);

figure;
plot(f, A_f);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Transformada de Fourier de la envolvente compleja g(t) - ASK');
grid on;
