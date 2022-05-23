function [H] = apHess(f, x)

% In: f ... (handle) anonymous function
%     x ... (handle) point where to approx. the gradient

n = length(x);
H = zeros(n, n) 
hs = nthroot(eps,4)*(speye(n) + spdiags(abs(x), 0, n, n));   %sparse matrix, solo guarda los unos y no los ceros

%Ahora necesitamos las derivadas
%Llenamos la parte de abajo de la diagonal de la Hessiana
for j = 1:n
    for i = j+1:n
       H(i, j) = 0.25*(f(x + hs(:, i) + hs(:, j)) ...
                       + f(x - hs(:, i) - hs(:, j)) ...
                       - f(x + hs(:, i) - hs(:, j))...
                       - f(x - hs(:, i) + hs(:, j)))...
                       / (hs(i, i)*hs(j, j));
    end
end

%Como la hessiana es simetrica:
H = H + H';   
%Llenamos la diagonal
for j = 1:n
    H(j, j) = (f(x + hs(:, j)) ...
                       + f(x - hs(:, j)) ...
                       - 2*f(x))...
                       / (hs(j, j)*hs(j, j));
end

end