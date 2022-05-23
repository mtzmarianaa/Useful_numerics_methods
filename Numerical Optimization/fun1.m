function [f] = fun1(x)
% Funcion objetivo para prueba de programacion cuadratica sucesiva

f = exp(prod(x)) - (1/2)*(x(1)^3 + x(2)^3 + 1)^2;


end