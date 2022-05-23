function [yp] = ejerc3(t, y)
%Funcion del ejercicio 3 tal que
%  9y′′ = −π2y
%Entonces
%  y'' = (1/9)*(−π2y)
%
%Usamos un cambio de variable z = y'. Entonces ahora tenemos
%   y'' = fname(t, y, z)
%   y'= s(t)
% y(1) == s'; y(2) == y'
%--------------------------------------------------------------------------
%

yp= zeros(2,1);
yp(1) = ((-(pi)^2)/9)*y(2);
yp(2) = y(1);


end

