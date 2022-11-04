% fourier transformation
function ret = saegezahn( f0,t )
  ret = 0;
  for k = 1:1000
    ret += (-1)^(k-1)/k * sin(2*pi*k*f0*t);
  endfor

  ret = ret * 2/pi;
end
