clear
close all
clc

b = [0.0691,0.1346,0.1346,0.0691];
a = [1,-1.2676,0.9,-0.2248];
x = zeros(16,1);
x(1) = 1;
n=0:length(x)-1;

y = filter(b,a,x);

figure(1);
hold on; grid on;
stem(n,y);
set(gca, "fontsize", 20);
xlabel('n');
ylabel('h[n]');
title('Impulsantwort');
