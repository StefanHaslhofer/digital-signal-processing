clear
close all
clc
pkg load symbolic

function X = dtft(x,nv,wv)
%DTFT Computes Discrete-time Fourier transform
%   @param  x : finite duration sequence over nv
%   @param  nv: sample position vector for x
%   @param  wv: vector of freqeuncy values
%   @return X : DTFT values computed at the frequencies in wv
X = exp(-j*wv'*nv) * x.';
% vectorize matrix multiplication
% https://de.mathworks.com/matlabcentral/answers/301391-matrix-vector-multiplication-vectorization

endfunction

n=-20:20
wv=linspace(-pi,pi)

xn = (0.8).^(abs(n)) .* (heaviside(n+10)-heaviside(n-11));
Xe = dtft(xn,n,wv)
Xabs = abs(Xe);
Xp = angle(Xe);

% c
figure(1);
subplot(2,1,1);
hold on;
grid on;
plot(wv, Xe)
set(gca, "fontsize", 24);
xlabel('\Omega');
ylabel('|X(e^{j\Omega})|');

subplot(2,1,2);
hold on;
grid on;
plot(wv, Xp)
set(gca, "fontsize", 24);
ylabel('Phase X');
xlabel('\Omega');



% d
wv=linspace(-4*pi,4*pi)
Xe = dtft(xn,n,wv)
Xabs = abs(Xe);
Xp = angle(Xe);

figure(2);
subplot(2,1,1);
hold on;
grid on;
plot(wv, Xe)
set(gca, "fontsize", 24);
xlabel('\Omega');
ylabel('|X(e^{j\Omega})|');

subplot(2,1,2);
hold on;
grid on;
plot(wv, Xp)
set(gca, "fontsize", 24);
ylabel('Phase X');
xlabel('\Omega');

