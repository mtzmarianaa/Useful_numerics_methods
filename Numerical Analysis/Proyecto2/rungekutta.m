function [t, y] = rungekutta(fname, a, b, ya, n)
%Método de Runge-Kutta para el problema de ecuacion diferencial 
%ordinaria con valor inicial.
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
% 2 de octubre de 2018

t = linspace(a, b, n)'; %particion del intervalo [a, b]
h = t(2) - t(1);
m = length(ya);
y = zeros (n, m); y(1, :) = ya';

for k = 1:(n-1)
    s1 = (feval(fname, t(k), y(k, :)))';
    s2 = (feval(fname, t(k) + (h/2), y(k, :)' + (h/2)*s1'))';
    s3 = (feval(fname, t(k) + (h/2), y(k, :)' + (h/2)*s2'))';
    s4 = (feval(fname, t(k) + h, y(k, :)' + h*s3'))';
    y(k+1,:)= y(k, :) + (h/6)*(s1 + 2*s2 + 2*s3 + s4);
end

end

