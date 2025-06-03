clear; clc; close all;

fs = 1000;
Tb = 0.1;
N = 20;

t_bit = 0:1/fs:Tb-1/fs;
t = 0:1/fs:N*Tb-1/fs;

bits = randi([0 1], 1, N);

f0 = 50;
f1 = 150;

g = [];

for i = 1:N
    f_bit = bits(i)*f1 + (1-bits(i))*f0;
    g_bit = exp(1j*2*pi*f_bit*t_bit);
    g = [g, g_bit];
end

G = fftshift(fft(g));
Nfft = length(g);
f = linspace(-fs/2, fs/2, Nfft);

figure;
plot(f, abs(G));
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Transformada de Fourier de la envolvente compleja g(t)');
grid on;
