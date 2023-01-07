clear
close all
clc

a = [1, -1.2676, 0.9, -0.2248];
b = [0.0691, 0.1346, 0.1346, 0.0691];

% specify 'whole' such that the values in w range from 0 to 2 pi
[h,w] = freqz(b, a, 1024, 'whole');
figure;
% plot based on octave doku https://octave.sourceforge.io/octave/function/freqz_plot.html
freqz_plot(w - pi, h, true);
