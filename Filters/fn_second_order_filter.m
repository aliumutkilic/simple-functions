%%% fn_first_order_filter.m - Written by Ali Kilic %%%
%%% Applies a discrete second order filter on an input signal %%%
%%% Inputs: x - input signal, wc - band frequency, zeta - damping ratio, dt - sampling period %%%
%%% x = [x_n, x_n-1, x_n-2] %%%

function filtered_signal = fn_second_order_filter(x,wc,zeta,dt)

    
    persistent u_prev;                                      %[u_n-1,u_n-2]

    %% Construct Transfer Function Model
    tf_model = tf([wc^2],[1,2*zeta*wc,wc^2]);               %Continuous tf
    discrete_model = c2d(tf_model,dt,'Tustin');             %Discrete tf
    [num, den] = tfdata(discrete_model);                    %Access tf numerator and denumerator
    num = cell2mat(num);                                    %Convert numerator to vector
    den = cell2mat(den);                                    %Convert denominator to vector


    %% First Iteration - set u_prev = [u_n-1,u_n-2]
    if isempty(u_prev)

        u_prev = [0, 0];

    end

    %% Filtering
    if length(x) ==1 

        filtered_signal = x(1);                    %First two iterations, no discrete filter defined for Tustin 
    elseif length(x) == 2
        filtered_signal = ([x(1),x(2),0]*num'- u_prev*[den(2);den(3)])/den(1);   
    else
        filtered_signal = (x*num'- u_prev*[den(2);den(3)])/den(1);

    end
    

    
    u_prev = [filtered_signal,u_prev(1)];             %Update u_prev


end