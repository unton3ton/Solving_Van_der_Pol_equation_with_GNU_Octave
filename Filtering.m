% https://www.geeksforgeeks.org/filter-function-in-matlab/

% MATLAB code for generating initial
% dummy signal with random errors
time = -pi:.1:pi;
rng default
input_signal = sin(time) + .23*rand(size(time));

% Defining the parameters b and a for
% the rational transfer function
b=(1/3)*ones(1,3);
a=1;

% Filtering the input signal
output = filter(b,a,input_signal);

% Plotting graphs of filtered and raw data to
% analyze the working of filtered data
hold on
plot(time,input_signal)
plot(time,output)
hold off
legend("Initial data","Filtered data")

