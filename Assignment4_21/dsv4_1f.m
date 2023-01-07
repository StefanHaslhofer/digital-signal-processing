clear
close all
clc

b = [0.0691,0.1346,0.1346,0.0691];
a = [1,-1.2676,0.9,-0.2248];
x = zeros(16,1);
x(1) = 1;

[h,w] = freqz(b, a, 1024, 'whole');

y = filter(b,a,x);
[h2,w2] = freqz(y, a, 1024, 'whole');

figure;
subplot(211); hold on; grid on;
% plot based on matlab doku https://de.mathworks.com/help/signal/ref/freqz.html
plot(w-pi,20*log10(abs(h)));
set(gca, "fontsize", 15);
title('Betragsgang H1');
ylabel('dB');
xlabel('Samples');

subplot(212); hold on; grid on;
plot(w2-pi, 20*log10(abs(h2)));
set(gca, "fontsize", 15);
title('Betragsgang H2');
ylabel('dB');
xlabel('Samples');
