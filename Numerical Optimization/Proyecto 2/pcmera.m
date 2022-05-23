function [x, lambda] = pcmera(Q, A,c,b)
% Este método ha sido modificado específicamente para el proyecto 2 de
% optimización numérica.
% Metodo del rango para el problema 
%   Min (1/2)*x'*Q*x + c'*x
%   S.A. a*x = b
%
% H es la inversa de Q
% A es mxn con rango(A) = m
% c .- vector columna de orden n
% b .- vector columna de orden m
% Out
% x.- vector columna de orden n con la solucion numerica del problema
% lambda .- vector columna de orden que representa el multiplicador de 
% Lagrande
%
%    Optimización numérica
%    ITAM
%    25.ago.20  y  24.oct.20
% Equipo: Santiago Muriel
%         Mariana G Martinez
%         Roman Velez

S = inv(Q);
B = A*S*A';
ld = -(b + A*S*c);

% Usamos gradiente conjugado
[lambda] = B\ld;

x = -S*( c + A'*lambda);

end