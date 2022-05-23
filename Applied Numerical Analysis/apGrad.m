function [g] = apGrad(f, x)

% In: f ... (handle) anonymous function
%     x ... (handle) point where to approx. the gradient

n = length(x);
g = zeros(n, 1)  %vector columna
hs = nthroot(eps,3)*(speye(n) + spdiags(abs(x), 0, n, n));   %sparse matrix, solo guarda los unos y no los ceros

%Ahora necesitamos las derivadas

for i = 1:n
    g(i) = 0.5*(f(x+ hs(:, i)) - f(x - hs(:, i))) / hs(i, i);
end



end

