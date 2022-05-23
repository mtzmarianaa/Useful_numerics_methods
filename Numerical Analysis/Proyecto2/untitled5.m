%Script: Ivsmatlab.m

fname = 'lorenzeq';
a = 0; b = 20;
ya = [5 5 5]';

[t, y] = rungekutta(fname, a, b, ya, n);
comet(y(:, 1), y(:, 2));

[t, y] = ode45