function [gfx] = gradiente(fname, a, tipdiff)
%                       GRADIENTE
% Se aproxima el gradiente de una funci?n real valuada fname en a.
% por medio de diferencias hacia adelante o difeencias centradas.
%
% usage:         [gfx] = gradiente(fname, a, tipdiff)
%
% donde: 
%               fname = cadena de caracteres que indica la
%                       funcion en MATLAB donde f(x) esta definida.
%               a = vector de dimension n.
%               tipdiff = escoge diferencias hacia adelante (1) o
%                         diferencias centradas (0)
%               gfx = gradiente de la funcion
%
%
%

h = 1e-08;
n = length(a);
gfx = zeros(n,1);

if nargin <= 2
    tipdiff = 1;
end

if (tipdiff == 1) % diferencias hacia adelante
    fa = feval(fname, a);
    for k=1:n
        x = a; x(k) = x(k) + h;
        gfx(k) = (feval(fname, x) - fa)/h;
    end
    
else % diferencias centradas
     for k=1:n
        a(k) = a(k) + h;
        f1 = feval(fname, a);
        a(k) = a(k) - 2*h;
        f2 = feval(fname, a);
        gfx(k) = (f1 - f2)/(2*h);
        a(k) = a(k)+h;
     end
end

% Programado por:
%
%           Jose Alonso Solis 
%           Roberto Ivan Lopez Lopez
%           Ernesto Jesus Ulloa Perez
%           Adolfo Martinez Gonzalez
