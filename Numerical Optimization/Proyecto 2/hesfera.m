function [h] = hesfera(x)
% Función de restricciones del problema de np puntos en la esfera unitaria
% de dimensión tres. Esta es diferente a hesferaM porque esta es la que
% vamos a usar en nuestro método, mientras que hesferaM es la que necesita
% la función de Matlab fmincon.
%
%  Optimzación Numérica
% ITAM
% 26.oct.20
% Equipo: Santiago Muriel
%         Mariana G Martinez
%         Roman Velez

g =[];     % uso de fmincon.m en Matlab

% Para agragar la restricción que u1 =(1, 0, 0) tenemos que x(1) = 1, 
% x(2) = 0 y x(3) = 0 
% es decir x(1) - 1 = 0, x(2) = 0 y x(3) = 0

n = length(x);
np = floor(n/3);
h = zeros(np+2,1);
h(1) = x(1)-1; % Para agregar la restricción x(1) - 1 = 0
h(2:3) = x(2:3); % Para agregar las restricciones x(2) = 0 y x(3) = 0
for j = 2:np
    uj = x(3*(j-1)+1:3*j);
    h(j+2) = uj'*uj-1;
end
end