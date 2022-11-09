#x = 0:0.1:3
#y = 2 * exp(i * x * 2 * pi * 1000);

#plot3(x,real(y),imag(y))
#xlabel('t')
#ylabel('Re(x)')
#zlabel('Im(x)')

#plot3(x,abs(y),arg(y))
#xlabel('t')
#ylabel('abs(x)')
#zlabel('arg(x)')



#x = -5:0.1:5
#y = sinc((pi .* x)) .* exp(-i .* pi .* x);
#plot3(x, real(y), imag(y))
#xlabel('f')
#ylabel('Re(X)')
#zlabel('Im(X)')

x = -5:0.1:5
y = sinc((pi .* x)) .* exp(-i .* pi .* x);
plot3(x, abs(y), arg(y))
xlabel('f')
ylabel('abs(X)')
zlabel('arg(X)')
