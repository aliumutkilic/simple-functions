%%% fn_first_order_filter.m - Written by Ali Kilic %%%
%%% Applies a discrete first order filter on an input signal %%%
%%% Inputs: x - input signal, wc - band frequency, dt - sampling period %%%
%%% x = [x_n, x_n-1] %%%

function filtered_signal = fn_first_order_filter(x,p)

    dt = p.gt;
    wc = p.wc1;
    a = parameterclass;

    
    persistent u_prev;                              %Previous output of the filter
    
    %% If no previous output, assign previous output as 0
    if isempty(u_prev)
        u_prev = single(0);
    end

    %% Get filtered signal from transfer function
    
    if length(x) ==1 
        filtered_signal = x;                        %If first iteration, don't filter
    else
        %filtered_signal = (x*den' - u_prev*num(end))/num(1);
        %% Filter discrete transfer function
        filtered_signal = a.calculateSomeValue/(2+dt*wc)*u_prev +  ((dt*wc)/(2+dt*wc))*(x(1)+x(2));
    end
    %% Update previous output in a persistent variable
    u_prev = filtered_signal;


end
