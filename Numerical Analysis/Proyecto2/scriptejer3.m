% script: scriptejer3.m


%
%
%Shooting method para el problema de ecuacion diferencial 
%ordinaria con valores iniciales.
%   y'' = fname(t,y, y')
%   y(a) = ya
%   y(b) = yb
%Usamos un cambio de variable z = y'. Entonces ahora tenemos
%   y'' = fname(t, y, z)
%   y'= s(t)
%Usamos el método Runge-Kutta para resolver este sistema. Damos dos valores
%iniciales para y', lo llamamos sa y sa2. Esto nos va a servir para usar 
%bisección y encontrar la solución (pues ya tenemos el valor que si es
%al final del intervalo, que es yb).
%
%

%
% 27 de noviembre de 2018
% Mariana Martínez Aguilar
%
% -------------------------------------------------------------------------
%


fname = 'ejerc3';
a = 0; b = (3/2);
ya = -1; yb = 3;
n = 1500;

%Elegimos los valores iniciales (al azar) de la primera derivada

sa = 2; sa2 = 4;

%Método numérico (lo elegimos conforme al resultado de v y v2) Con esto
%vamos a comparar los resultados que obtenemos con sa y sa2 con el que sí 
%es (yb).
[t, z] = rungekutta (fname, a, b, [sa ya]', n);
[t, z2] = rungekutta(fname, a, b, [sa2 ya]', n);

%Aquí tiene que haber cambio de signo para despúes poder usar bisección
 
v = z(n, 2) -yb
v2 = z2(n, 2) -yb

%Biseccion en este caso hay cambio de signo, usamos este metodo

alfa = 2; beta = 4;
falfa = v; fbeta = v2;
tol = 1.e-08; maxiter = 50; iter = 0;
while (abs(beta-alfa)> tol && iter < maxiter && falfa*fbeta < 0)
    c = (alfa + beta)/2;
    [t, zz] = rungekutta(fname, a, b, [c ya]', n);
    fc = zz (n, 2) - yb;
    if (falfa*fc < 0)
        beta = c;
        fbeta = fc;
    else
        alfa = c;
        falfa = fc;
    end
    iter = iter + 1;
end

if (fc == 0)
    raiz = c;
else
    raiz = (alfa+beta)/2;
    [t, zz] = rungekutta(fname, a, b, [raiz ya], n);
end
raiz

%Graficamos
yy= zz(:, 2);
plot (t, yy, 'b', a, ya, 'dr', b, yb, 'dr', 'Linewidth', 3)
title ('Solución del método del disparo (Bisección)')