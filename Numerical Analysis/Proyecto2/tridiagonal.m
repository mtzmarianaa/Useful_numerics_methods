function [x] = tridiagonal(a, b, c, g)
% Se calcula la solucion del sistema lineal A*x = g
% donde A es tridiagonal y esta representada por los vectores a, b y c
% In
%  a.- vector columna de longitud n con la diagonal de A
%  b.- vector columna de longitud (n-1) y es la supra diagonal de A
%  c.- vector columna de longitud (n-1) y es la subdiagonal de A.
%  g.- vector columna de longitud n, es el lado derecho del sistema A*x = g
%
% Out
%  x.- vector columna de longitud n con la solucion del sistema lineal
%
% -------------------------------------
%
% Mariana Martínez Aguilar
%
% -------------------------------------

%Inicializamos
hata = a;
hatb = b;
hatc = c;
n = length(a);
y = zeros(n,1);
x = zeros(n,1);

% Factorizacion LU

for k = 1:(n-1)
    hatc(k) = hatc(k)/hata(k);
    hata(k+1) = hata(k+1) - hatc(k)*hatb(k);
end


% Primera parte al resolver el sistema LU, resolver el sistema Ly = g

y(1) = g(1);

for k = 2:(n)
    y(k) = g(k) - hatc(k-1)*y(k-1);
end


% Segunda parte al resolver el sistema LU, resolvemos el sistema Ux=y

x(n) = y(n)/hata(n);

for k = n-1:-1:1
    x(k) = (y(k) - hatb(k)*x(k+1))/hata(k);
end

end

