a = [1, -1.5, 0.625];
b = [1, 1, 1, 1];

x = linspace(-pi,pi,1024);
y = freqz(b,a,1024);

figure;
subplot(211); hold on; grid on;
plot(x,abs(y))
xlabel('\Omega');
ylabel('|H1(e^{j\Omega}|');
title('Betragsgang');

subplot(212); hold on; grid on;
plot(x,angle(y))
xlabel('\Omega');
ylabel('arg(H1(e^{j\Omega})');
title('Phasengang');