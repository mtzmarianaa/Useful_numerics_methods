% script: diferenciasfinitasejer6.m

%Resolvemos el sistema con condiciones iniciales (y finales)
%  y′′ = 4y
%  y(0) = 1
%  y(1) = 3
%
%En el intervalo igualmente espaciado entre 0 y 1 con 6 puntos.

fnamep = "nada";
fnameq = "tareafuncionq";
fnamer = "nada";
a = 0;
b = 1;
alfa = 1; 
beta = 3;
n = 6;

%Resolvemos con el método de diferencias finitas
[t, y] = diferenciasfinitas(fnamep, fnameq, fnamer, a, b, alfa, beta, n);

%Graficamos la solución

plot (t, y, 'b', a, alfa, 'dr', b, beta, 'dr', 'Linewidth', 3)



