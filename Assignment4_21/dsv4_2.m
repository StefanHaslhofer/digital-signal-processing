x = chirp((0:511), 0, 511, 0.02);
h=hanning(128)'/ sum(hanning(128));
fastOverlapResult = overlapAdd(x, h);
convResult = conv(x,h);

figure
plot(fastOverlapResult)
hold on; grid on;
plot(convResult)
legend('overlap-add','conv(x,h)')
xlabel('n');
ylabel('y[n]');
title('Vergleich von Overlap-Add und conv')

figure
subplot(311)
plot(x);
xlabel('1');
ylabel('x[1]');
title('Eingangssignal')

subplot(312)
plot(h);
xlabel('n');
ylabel('h[n]');
title('Impulsantwort')

subplot(313) 
plot(fastOverlapResult);
xlabel('n');
ylabel('y[n]');
title('Ausgangssignal')



function result = overlapAdd(inputSignal, impulseResponse)
    L_h = length(impulseResponse);
    L_x = 256;
    L_FTT = smallestPowerOfTwo(L_h + L_x - 1);
    %result = zeros(L_h + L_x - 1);

    fir_FFT = fft(impulseResponse, L_FTT);
    %splitted_blocks = reshape(inputSignal, L_x, []);
    blocks_FFT_1 = fft(inputSignal(1:256), L_FTT);
    blocks_FFT_2 = fft(inputSignal(257:512), L_FTT);

    f_blocks_1 = real(ifft(blocks_FFT_1 .* fir_FFT, L_FTT));
    f_blocks_2 = real(ifft(blocks_FFT_2 .* fir_FFT, L_FTT));

    result = f_blocks_1 + f_blocks_2;
    
    %splitted_blocks_size = size(splitted_blocks);
    %nr_of_cols = block_size(2);

    %for i = 1:nr_of_cols
    %    result((size(result)/nr_of_cols) *(i - 1) + 1 : (size(result)/nr_of_cols) * i) = real(ifft(blocks_FFT(:,i) .* fir_FFT));
    %end
end

% returns the smallest power of two greater than the given value n
function result = smallestPowerOfTwo(n)
    if n <= 0
        result = 0;
    else
        result = 1;
        while result < n
            result = result * 2;
        end
    end
end