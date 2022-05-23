function [wp] = funbvp1(t, w)
%Ecuacion diferencial ordinaria para el problema de valores de 
% frontera.
% w(1) == s'; w(2) == y'

wp = zeros(2,1);
wp(1) = w(2) + (2/3)*exp(t);
wp(2) = w(1);

end

