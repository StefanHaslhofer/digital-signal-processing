clear
close all
clc

pkg load signal;

b = [0.0691,0.1346,0.1346,0.0691];
a = [1,-1.2676,0.9,-0.2248];
x = zeros(16,1);
x(1) = 1;
n=0:length(x)-1;

figure(1);
subplot(211); hold on; grid on;
stem(n,filter(b,a,x));
set(gca, "fontsize", 15);
xlabel('n');
ylabel('h[n]');
title('Impulsantwort');

subplot(212); hold on; grid on;
stem(n,filter(residuez(b,a), 1, x));
set(gca, "fontsize", 15);
xlabel('n');
ylabel('h[n]');
title('Impulsantwort (Partialbruchzerlegung)');

[r,p,k] = residuez(b,a);
figure(2);
% plot based on matlab doku https://de.mathworks.com/help/signal/ref/residuez.html
zplane(b,a);
hold on;
plot(p,'^r');
hold off;
