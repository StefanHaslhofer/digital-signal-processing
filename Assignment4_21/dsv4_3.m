x = [4, 0, -3];
h = [0.333333, 0.166666];
y = conv(x, h);

figure;
subplot(311);
grid on; hold on;
title('Eingangssignal');
stem(x);
xlabel('n');
ylabel('x[n]');
axis([0 5 -5 5])

subplot(312);
grid on; hold on;
title('Impulsantwort');
stem(h);
xlabel('n');
ylabel('h[n]');
axis([0 5 0 0.5])

subplot(313);
grid on; hold on;
title('Ausgangssignal');
stem(y);
xlabel('n');
ylabel('y[n]');
axis([0 6 -2 2])
