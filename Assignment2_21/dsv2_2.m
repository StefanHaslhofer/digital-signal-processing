clear
close all
clc

Fs = 5;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 10;             % Length of signal
t_n = (0:T:L);

t = (0:0.001:L);
f0=6

x_n=sin(2*pi*6/14*t);
x_n1=sin(2*pi*(5+6/14)*t_n);
x_n2=sin(2*pi*(2*5+6/14)*t_n);

set(gca, "fontsize", 32);
hold on
plot(t,x_n)
stem(t_n,x_n1)
stem(t_n,x_n2)
hold off
xlabel("f(Hz)")
ylabel("X(f)")
legend('x(f)', 'x[n]')
