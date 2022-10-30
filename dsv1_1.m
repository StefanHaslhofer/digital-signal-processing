clear
close all
clc

function ret = fourier_series (a, b, f0, t)
  omega = 2 * pi * f0;
  prefix = a(1)/2;

  # iterate over time vector
  for i = 1:length(t)
    f_sum = 0;

    # iterate over coefficient vector
    for k = 1:length(a)
      f_sum = f_sum + (a(k) * cos(omega*k*t(i)) + b(k) * sin(omega*k*t(i)));
    endfor

    ret(i) = f_sum + prefix;
  endfor
end

# function that calculates b vector for "Sägezahnsignal"
function ret = coeff (len)
  for k = 1:len
    ret(k) = (-1)^(k-1)/k;
  endfor
end

# calculate input parameters
f0 = 10;
t = [0 : 0.01 : 2/f0];
a = zeros(length(t),1); # vector a consists of zeros
b = coeff(length(t));

n10 = fourier_series(a, b, 10 * f0, t);

#n100 = fourier_series(a, b, 100 * f0, t);

#n10000 = fourier_series(a, b, 10000 * f0, t);

# plot fourier series
figure (1);
hold on
plot(t, n10);
hold on
#plot(t, n100)
hold on
#plot(t, n10000, 'g')

xlabel('t');
ylabel('x(t)');
legend('N10', 'N100', 'N10000')
hold off

# calculate and plot fourier coefficients
n = fourier_series(a, b, f0, t);

function a = fourier_coeff_a(n, f0, t)
  t0 = 1/f0;
  prefix = 2/t0;
  for k = 1:length(t)
    a(k) = quad((n(k) * cos(2*pi*k*f0*t(k))), -t0/2, t0/2);
  endfor
end

n10_a = fourier_coeff_a(n, f0, t);

figure (2);
plot(t, n10_a);
xlabel('k');
ylabel('ak');
