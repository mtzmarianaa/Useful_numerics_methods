function [x, lambda] = pcmera(Q,A,c,b)
% Metodo del rango para el problema 
%   Min (1/2)*x'*Q*x + c'*x
%   S.A. a*x = b
%
% Q es nxn simétrica positiva definida en R^n cuya inversa es facil de
% calcular
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

S = inv(Q);
B = A*S*A';
ld = -(b + A*S*c);

% Usamos gradiente conjugado
[lambda] = B\ld;

x = -S*( c + A'*lambda);

end