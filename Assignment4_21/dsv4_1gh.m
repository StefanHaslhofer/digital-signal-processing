clear
close all
clc

pkg load signal;

b = [0.0691,0.1346,0.1346,0.0691];
a = [1,-1.2676,0.9,-0.2248];

[r,p,k] = residuez(b,a);

figure(1);
% plot based on matlab doku https://de.mathworks.com/help/signal/ref/residuez.html
zplane(b,a);
hold on;
plot(p,'^r');
hold off;
