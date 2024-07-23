# https://runebook.dev/ru/docs/octave/matlab_002dcompatible-solvers

fvdp = @(t,y) [y(2); (1 - y(1)^2) * y(2) - y(1)];

[t,y] = ode45 (fvdp, [0, 20], [2, 0]);

plot(t,y)
