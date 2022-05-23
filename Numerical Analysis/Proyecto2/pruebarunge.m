% script: prueba lorenz.m
%probamos los metodos:
% Euler
% Trapecio
% Runge-Kutta de orden 4
%con las ecuaciones diferenciales de Lorenz.
close all
%estas son las condiciones iniciales
fname = 'lorenzeq';
a = 0; b = 20;
ya = [5 5 5]';
n = 1000; 

[t1, y1] = mieuler(fname, a, b, ya, n);
xx1 = y1(:, 1);
yy1 = y1(:, 2);


%vamos con el método del trapecio

[t, y] = mitrapecio(fname, a, b, ya, n);
xx = y(:, 1);
yy = y(:, 2);

[t2, y2] = rungekutta(fname, a, b, ya, n);
xx2 = y(:, 1);
yy2 = y(:, 2);

[t4, y4] = adambashforth2(fname, a, b, ya, n);
xx4 = y(:, 1);
yy4 = y(:, 2);

% figure(1)
% comet(xx, yy)
% title('Método de Trapecio / Ecuaciones de Lorenz')
% figure(2)
% comet(xx1, yy1)
% title('Método de Euler/ Ecuaciones de Lorenz')
% figure(3)
% comet(xx2, yy2)
% title('Método de Runge-Kutta/ Ecuaciones de Lorenz')
% hold on
figure(4)
comet(xx4, yy4)
title('Método de Adams-Bashforth/ Ecuaciones de Lorenz')

