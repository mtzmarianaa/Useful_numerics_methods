function [x] = mDesCic(A, b, x0, tol)
%Descenso ciclico
%No se usan operaciones con vectores para calcular alpha
%ni r, se usan entradas (que son numeros) para tratar de hacerlo
%mas barato
x = x0;
r = A*x - b;
j = 1;
n = length(x);
%No queremos accesar a una entrada del vector que no existe
%Por eso definimos n
%Usamos modulo para no "salirnos" del vector.
while norm(r, 'inf') > tol
    alpha = -r(j)/A(j,j);
    x(j) = x(j) + alpha;
    r = A*x - b;
    j = mod(j, n) + 1; 
end

end

