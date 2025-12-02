%%% fn_moving_average.m - Written by Ali Kilic %%%
%%% Applies a simple moving average filter to an input signal %%%
%%% Inputs: x - input signal, window - filter averaging window %%%
%%% x = [x_n,x_n-1,x_n-2,....x_1] %%%

function averaged_signal = fn_moving_average(x,window)

    averaged_signal = 0;
    for i = 1:window
        if i > length(x)                                        %If window size is bigger than input vector, clip averaging
            window = i-1;
            break;
        else
            averaged_signal = averaged_signal + x(end-i+1);     %Sum
        end
    end

    averaged_signal = averaged_signal/window;                   %Average

end
