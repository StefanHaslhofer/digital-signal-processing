clear
close all
clc

% alle frequenzen geteilt durch 1000 für einfachere darstellung
Fs = 12;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 1;             % Length of signal
t_n = (0:T:L);        % Time vector for discrete signal

f1=5;
f2=7;

t = (0:0.001:1);        % Time vector

x1=sin(2*pi*f1*t);
x2=sin(2*pi*f2*t);
x=x1+x2;
xn=sin(2*pi*f1*t_n) + sin(2*pi*f2*t_n);

figure(2);
set(gca, "fontsize", 32);
hold on
plot(t,x)
stem(t_n,xn)
hold off
xlabel("f(Hz)")
ylabel("X(f)")
legend('x(f)', 'x[n]')


