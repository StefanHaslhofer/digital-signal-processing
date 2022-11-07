clear
close all
clc

function ret = fourier_series (a, b, f0, t)
  omega = 2 * pi * f0;
  prefix = a(1)/2;

  % iterate over time vector
  for i = 1:length(t)
    f_sum = 0;

    % iterate over coefficient vector
    for k = 1:length(a)
      f_sum = f_sum + (a(k) * cos(omega*k*t(i)) + b(k) * sin(omega*k*t(i)));
    endfor

    ret(i) = f_sum + prefix;
  endfor
end

% function that calculates b vector for "Sägezahnsignal"
function ret = coeff (len)
  for k = 1:len
    ret(k) = 2/pi*(-1)^(k-1)/k;
  endfor
end

% calculate input parameters
f0 = 10;
t = [0 : 0.0001 : 2/f0];
a = zeros(length(t),1); % vector a consists of zeros
b = coeff(length(t));

n10 = fourier_series(a, b, 10 * f0, t);

n100 = fourier_series(a, b, 100 * f0, t);

n10000 = fourier_series(a, b, 10000 * f0, t);



% plot fourier series
figure (1);
set(gca, "fontsize", 32);
hold on
plot(t, n10);
hold on
plot(t, n100)
hold on
plot(t, n10000, 'g')

xlabel('t');
ylabel('x(t)');
legend('N10', 'N100', 'N10000')
hold off

% plot coefficients
figure (2);
set(gca, "fontsize", 32);
hold on
bar([1:length(b)], b);
xlabel('k');
ylabel('bk');
hold off

figure (3);
set(gca, "fontsize", 32);
hold on
bar([1:length(a)], a);
xlabel('k');
ylabel('ak');
hold off








% calculation of ck (only for tests)
function ck = get_ck()
  t0 = 1/f0;
  prefix = 2/t0;

  for k = 1:length(t)
    func = @(t) n(k).*cos(2.*pi.*k.*f0.*t);
    a(k) = prefix * integral(func, -t0/2, t0/2);
  endfor

  ck = prefix * sum;
end

% calculation for coefficients (only for tests)
function x = signal(t)
  omega = 2 * pi * 10;
  prefix = 2/pi;
  sum = 0;

  for k = 1:length(t)
    sum += (-1)^(k-1)/k*sin(omega*k*t);
  endfor

  x = prefix * sum;
end

function a = fourier_coeff_a(f0, t)
  t0 = 1/f0;
  prefix = 2/t0;

  for k = 1:length(t)
    func = @(t) n(k).*cos(2.*pi.*k.*f0.*t);
    a(k) = prefix * integral(func, -t0/2, t0/2);
  endfor
end

function a = fourier_coeff_b(f0, t)
  t0 = 1/f0;
  prefix = 2/t0;

  for k = 1:length(t)
    % n(k) is wrong we need n(t)
    func = @(t) signal(t).*sin(2.*pi.*k.*f0.*t);
    a(k) = prefix * integral(func, -t0/2, t0/2);
  endfor
end

%n10_b = fourier_coeff_b(10 * f0, t);
