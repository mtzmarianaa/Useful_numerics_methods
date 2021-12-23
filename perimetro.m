function [per] = perimetro(w)
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
% 19.nov.20

[dimension2, ~] = size(w);
n = dimension2/2 + 1;

d1 = w(1);
dn = w(n-1);
per = d1+dn;

for k = 1:(n-2)
    rk = w(k);
    thetak = w( (n-1) + k );
    rk1 = w(k+1);
    thetak1 = w(n+k);
    per = per + sqrt( rk^2 + rk1^2 - 2 * rk * rk1 * cos(thetak - thetak1) );
end

per = -per;

end






