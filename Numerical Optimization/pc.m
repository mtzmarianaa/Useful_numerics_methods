function [x, lambda] = pc(Q, A, c, b)

% Método directo para resolver el problema 
%   Min (1/2)*x'*Q*x + c'*x
%   S.A. a*x = b
%
% Q es nxn simétrica positiva definida en el espacio nulo de A
% A es mxn con rango(A) = m
% c .- vector columna de orden n
% b .- vector columna de orden m
% Out
% x.- vector columna de orden n con la solucion numerica del problema
% lambda .- vector columna de orden que representa el multiplicador de 
% Lagrande
%
%    Optimizacion numerica
%    ITAM
%    25.ago.20

m = length(b);    % numero de restricciones
n = length(c);    % numero de variables

K = [Q A'; A zeros(m)];

ld = [-c; b];

% Resolver el sistema lineal K*w = ld
%  w = [x;lambda];

w = K\ld;
x = w(1:n);
lambda = w(n+1:n+m);


end