function [h] = hesfera2(x)
% Funcion de restriciones (vector) del problema de np puntos en la esfera
% unitaria de dimension tres.
% 
% Optimizacion Numerica
% 20.oct.20 (clase)
% Dr. Zeferino Parada Garcia
% Cambio de la funcion hesfera()

g = [] % uso de fmincon.m en MatLab

n = length(x);
np = floor(n/3);

% Por cada punto hay una restriccion
h = zeros(np,1);

for j = 1:np
    uj = x( 3 * ( j - 1 ) + 1 : 3 * j );
    h( j ) = uj' * uj - 1;
end
    