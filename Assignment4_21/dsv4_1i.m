clear
close all
clc

pkg load signal;

a = [1, -1.2676, 0.9, -0.2248];
b = [0.0691, 0.1346, 0.1346, 0.0691];

zreal = [-1.5:0.05:1.5];
zimag = [-2:0.05:2];
zinv = ( repmat(zreal, size(zimag')) + 1i*repmat(zimag',size(zreal)) ).^(-1);

% Übertragungsfunktion
yi = b(1) + b(2)*zinv + b(3)*zinv.^2 + b(4)*zinv.^3;
xi = a(1) + a(2)*zinv + a(3)*zinv.^2 + a(4)*zinv.^3;
hi = yi ./ xi;

figure; hold on; grid on;
mesh(zreal, zimag, 20*log10(abs(hi)), 'FaceColor', 'flat');

zv = exp(-i * linspace(-pi, pi, 100));
zvinv = zv.^(-1);

yzv = b(1) + b(2)*zvinv + b(3)*zvinv.^2 + b(4)*zvinv.^3;
xzv = a(1) + a(2)*zvinv + a(3)*zvinv.^2 + a(4)*zvinv.^3;
hzv = yzv ./ xzv;


plot3(real(zv), imag(zv), 20*log10(abs(hzv)), 'r', 'LineWidth', 2);
axis([-1.5 1.5 -2 2 -100 40]);
xlabel('real(z)');
ylabel('imag(z)')
zlabel('20*log10(abs(H))');
