% a)

% window and fft length
N_Window = 64;
N_FFT = 2048;
% rectangle
rw = rectwin(N_Window);
figure
subplot(4,1,1); hold on; grid on;
stem(rw);
ylim([0 1.3]);
title('Rechtecksfenster im Zeitbereich');
%wvtool(rw);

% bartlett
bw = bartlett(N_Window);
subplot(4,1,2); hold on; grid on;
stem(bw);
ylim([0 1.3]);
title('Bartlettfenster im Zeitbereich');
%wvtool(bw);

% Hann
hw = hann(N_Window);
subplot(4,1,3); hold on; grid on;
stem(hw);
ylim([0 1.3]);
title('Hannfenster im Zeitbereich');
%wvtool(hw);

% Blackman
blackw = blackman(N_Window);
subplot(4,1,4); hold on; grid on;
stem(blackw);
ylim([0 1.3]);
title('Blackmannfenster im Zeitbereich');
%wvtool(blackw);

% b)
omega = -(-N_FFT/2:N_FFT/2-1)*pi/N_FFT;

figure
rw_X = rw'/N_Window;
X_rw = calculateLb(rw_X, N_FFT);
subplot(4,1,1); hold on; grid on;
plot(omega, X_rw);
title('Rechtecksfenster transformiert');
xlabel('\Omega');
ylabel('Magnitude [db]');

bw_x = bw'/sum(bartlett(N_Window));
X_bw = calculateLb(bw_x, N_FFT);
subplot(4,1,2); hold on; grid on;
plot(omega, X_bw);
title('Bartlettfenster transformiert');
xlabel('\Omega');
ylabel('Magnitude [db]');

hw_x = hw'/sum(hann(N_Window))*2;
X_hw = calculateLb(hw_x, N_FFT);
subplot(4,1,3); hold on; grid on;
plot(omega, X_hw);
title('Hannfenster transformiert');
xlabel('\Omega');
ylabel('Magnitude [db]');

blackw_x = blackw'/sum(blackman(N_Window));
X_blackw = calculateLb(blackw_x, N_FFT);
subplot(4,1,4); hold on; grid on;
plot(omega, X_blackw);
title('Blackmannfenster transformiert');
xlabel('\Omega');
ylabel('Magnitude [db]')


% d)
 fs = 200;
 f1 = 50;
 d = 0.5;
 t = 1/fs:1/fs:d; 
 sinus_1 = sin(2*pi*f1*t);
 figure
 plot(t,sinus_1);
 title("Sinus (50 Herz mit 200 Hertz für 0.5 Sekunden abgetastet)")

% e)
N_w = length(t);
xx1 = rectwin(N_w)'/N_w;
xx2 = bartlett(N_w)'/sum(bartlett(N_w));
xx3 = hann(N_w)'/sum(hann(N_w))*2;
xx4 = blackman(N_w)'/sum(blackman(N_w));

rect_sin = sinus_1 .* xx1;
bart_sin = sinus_1 .* xx2;
hann_sin = sinus_1 .* xx3;
black_sin = sinus_1 .* xx4;

X1_n = calculateLb(rect_sin, N_FFT);
X2_n = calculateLb(bart_sin, N_FFT);
X3_n = calculateLb(hann_sin, N_FFT);
X4_n = calculateLb(black_sin, N_FFT);

figure
subplot(2,1,1); hold on; grid on;
plot(rect_sin);
plot(bart_sin);
plot(hann_sin);
plot(black_sin);
title('Mit Sinus gewichtete Fensterfunktionen');
xlabel('Sample')
ylabel('Amplitude')
legend('Rechteck','Bartlett','Hann','Blackman');

subplot(2,1,2); hold on; grid on;
plot(omega,X1_n);
plot(omega,X2_n);
plot(omega,X3_n);
plot(omega,X4_n);
xlabel('\Omega')
title('Mit Sinus gewichtete Fensterfunktionen, transformiert');
ylabel('Magnitude [dB]')
legend('Rect','Bartlett','Hann','Blackman');

% f)
sinus_2 = sin(2*pi*48*t) + sin(2*pi*52*t);
sinus_3 = sin(2*pi*50*t) + 0.1*sin(2*pi*60*t);

rect_sin_2 = sinus_2 .* xx1;
bart_sin_2 = sinus_2 .* xx2;
hann_sin_2 = sinus_2 .* xx3;
black_sin_2 = sinus_2 .* xx4;

X1_sin_2 = calculateLb(rect_sin_2, N_FFT);
X2_sin_2 = calculateLb(bart_sin_2, N_FFT);
X3_sin_2 = calculateLb(hann_sin_2, N_FFT);
X4_sin_2 = calculateLb(black_sin_2, N_FFT);

figure
subplot(2,1,1); hold on; grid on;
plot(rect_sin_2);
plot(bart_sin_2);
plot(hann_sin_2);
plot(black_sin_2);
title('Mit Sinus x_1 gewichtete Fensterfunktionen');
xlabel('Sample')
ylabel('Amplitude')
legend('Rechteck','Bartlett','Hann','Blackman');

subplot(2,1,2); hold on; grid on;
plot(omega,X1_sin_2);
plot(omega,X2_sin_2);
plot(omega,X3_sin_2);
plot(omega,X4_sin_2);
xlabel('\Omega')
title('Mit Sinus x_1 gewichtete Fensterfunktionen, transformiert');
ylabel('Magnitude [dB]')
legend('Rect','Bartlett','Hann','Blackman');


rect_sin_3 = sinus_3 .* xx1;
bart_sin_3 = sinus_3 .* xx2;
hann_sin_3 = sinus_3 .* xx3;
black_sin_3 = sinus_3 .* xx4;

X1_sin_3 = calculateLb(rect_sin_3, N_FFT);
X2_sin_3 = calculateLb(bart_sin_3, N_FFT);
X3_sin_3 = calculateLb(hann_sin_3, N_FFT);
X4_sin_3 = calculateLb(black_sin_3, N_FFT);

figure
subplot(2,1,1); hold on; grid on;
plot(rect_sin_3);
plot(bart_sin_3);
plot(hann_sin_3);
plot(black_sin_3);
title('Mit Sinus x_2 gewichtete Fensterfunktionen');
xlabel('Sample')
ylabel('Amplitude')
legend('Rechteck','Bartlett','Hann','Blackman');

subplot(2,1,2); hold on; grid on;
plot(omega,X1_sin_3);
plot(omega,X2_sin_3);
plot(omega,X3_sin_3);
plot(omega,X4_sin_3);
xlabel('\Omega')
title('Mit Sinus x_2 gewichtete Fensterfunktionen, transformiert');
ylabel('Magnitude [dB]')
legend('Rect','Bartlett','Hann','Blackman');

 % Functions
 function result = calculateLb(s, N)
    X = fft(s, N); 
    lb = fftshift(X);
    result = 20 * log10(abs(lb)) ;
 end