function [t, y] = diferenciasfinitas(fnamep, fnameq, fnamer, a, b, alfa, beta, n)
%Metodo de diferencias finitas para el problema
% y''= fnamep*y' + fnameq*y + fnamer
%
%Con los siguientes valores iniciales:
% y(a) = alfa, y(b) = beta;
%
% ----------------------------------------
%
% Mariana Martínez Aguilar
% 27 de noviembre de 2018
%
% ----------------------------------------

%Valores iniciales
t = linspace(a, b, n)';
%Particion igualmente espaciada
h = t(2) - t(1);
y = zeros(n, 1);
y(1) = alfa;
y(n) = beta;

p = zeros(n,1);
q = zeros(n,1);
r = zeros(n,1);

%Hacemos evaluaciones

for k = 1:n
    taux = t(k);
    p(k) = feval(fnamep, taux);
    q(k) = feval(fnameq, taux);
    r(k) = feval(fnamer, taux);
end

%-----------------------------------------
%vectores de la matriz tridiagonal
%Creamos los vectores con sus respectivas dimensiones
va = zeros(n-2, 1);
vp = zeros(n-3, 1);
vc = zeros (n-3, 1);

va = 2 + (h^2)*q(2:n-1);
vp = -(1 + (h/2)*p(3:n-1));
vc = -1 + (h/2)*p(3:n-1);

%-------------------------------------------
%Lado derecho del sistema

g = -h*r(2:n-1);
g(1) = g(1) + (1 + (h/2)*p(2))*alfa;
g(n-2) = g(n-2) + (1 - (h/2)*p(n-1))*beta;

%-------------------------------------------
%Resolvemos esto con el método tridiagonal
[vy] = tridiagonal(va, vp, vc, g);

y = [alfa; vy; beta];

end

