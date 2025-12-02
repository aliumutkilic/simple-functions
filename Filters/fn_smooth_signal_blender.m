%%% fn_smooth_signal_blender.m - Written by Ali Kilic %%%
%%% Smoothly interpolates between two signals in a given window. %%%
%%% Inputs: t0 - interpolation start time, t1 - interpolation end time, t - current time, x1 - signal 1, x2 - signal 2 %%%
%%% x = [x_n, x_n-1, x_n-2] %%%

function blended_signal = fn_smooth_signal_blender(t,t0,t1,x1,x2)


s = (t-t0)/(t1-t0);
polynomial_blender = s^2*(3-2*s);

if t<=t0
    blended_signal = x1;
elseif t>=t1
    blended_signal = x2;
else
    blended_signal = x1*(1-polynomial_blender)+x2*polynomial_blender;
end


end
