function [obj] = fObjetivo(w)
% Vector que calcula el perimetro dado los puntos en w (en coordenadas
% polares), son vértices de un polígono.
%
% IN:
%   w : vector de 2(n-1) con coordenadas polares de vértices del polígono
% OUT:
%   per : perímetro del polígono
%
% Optimización Numérica
% Otoño 2020
% 30.nov.20


[dimension2, ~] = size(w);
n = dimension2/2 + 1;
obj = [];

for k = 1:(n-2)
    rk = w(k);
    thk = w( (n-1)+k );
    rk1 = w(k+1);
    thk1 = w( n + k );
    obj = obj + rk*rk1*sin(thk1 - thk);
end




end