clear
close all
clc


% fourier transform
f0 = 10;
t = [0 : 0.0001 : 2/f0];

x = saegezahn(f0, t);
y = fft(x);

figure (1);
plot(t, x);



f_all = abs(y/length(t));
f_p = f_all(1:length(t)/2+1);
f_p(2:end-1) = 2*f_p(2:end-1);

% scale frequency because our sampling period is only 0.2 (= 2/10)
f = 10000*(0:(length(t)/2))/length(t);

figure (2);
hold on;
plot(f, f_p);
plot(-f, f_p);
xlim([-40 40])
hold off;
xlabel("f(Hz)")
ylabel("X(f)")

