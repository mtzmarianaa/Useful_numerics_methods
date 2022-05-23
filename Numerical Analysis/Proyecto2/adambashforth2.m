function [t, y] = adambashforth2(fname, a, b, ya, n)
%Método de Adams-Bashforth de orden 2 para el
% problema de ecuacion diferencial ordinaria con 
%valor inicial
%   y' = fname(t,y)
%   y(a) = ya
%
%
%In
% fname .- cadena de caracteres con el nombre de la funcion
% a .- número real
% b .- número real
% ya .- número real con el valor inicial en t=a
% n .- número de puntos en 1 partición igualmente espaciada de [a, b]
% Out
% t .- vector de longitud n con los elementos de la partición
% y .- vector de longitud n, se satisface que:
%        y(k) es una aproximacion a y(t(k)) , k= 1:n.
% ----------------------------------------------------------------------
% 16 de octubre de 2018

t = linspace(a, b, n)'; %particion del intervalo [a, b]
h = t(2) - t(1);
m = length(ya);
y = zeros (n, m); 
y(1, :) = ya'; %ya tenemos el primer punto
f1 = feval(fname, t(1), y(1,:)')';
y(2, :) = y(1, :) + h*f1; %calculamos el segundo
%punto con Eule (este metodo necesita dos puntos)

for k = 2:(n-1)
    f0 = feval(fname, t(k), y(k,:)')';
    y(k+1,:)= y(k, :) + (h/2)*(3*f0 -f1);
    f1 = f0;
end

end

