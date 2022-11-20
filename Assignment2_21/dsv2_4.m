clear
close all
clc

f=100;

Sa=[0,ones(1,f*4),(1:-1/f:0),(0:1/f:1),ones(1,f*4),0];
Sp=[0,(pi/2)*ones(1,1+f*5),(-pi/2)*ones(1,1+f*5),0]
Sx=Sa.*exp(i.*Sp);

t=10/length(Sa);
y=(-5+t:t:5)

figure(1);
subplot(4,1,1);
plot(y,Sa,'LineWidth',1.5)
grid on;
set(gca, "fontsize", 18);
set(gca, 'box', 'off')
xlabel("f(kHz)")
ylabel("|X(f)|")

subplot(4,1,2);
plot(y,Sp,'LineWidth',1.5)
grid on;
set(gca, "fontsize", 18);
set(gca, 'box', 'off')
xlabel("f(kHz)")
ylabel("phase(f)")


subplot(4,1,3);
plot(y,imag(Sx),'LineWidth',1.5)
grid on;
set(gca, "fontsize", 18);
set(gca, 'box', 'off')
xlabel("f(kHz)")
ylabel("Im{X(f)}")

subplot(4,1,4);
plot(y,zeros(1,length(y)),'LineWidth',1.5)
grid on;
set(gca, "fontsize", 18);
set(gca, 'box', 'off')
xlabel("f(kHz)")
ylabel("Re{X(f)}")
