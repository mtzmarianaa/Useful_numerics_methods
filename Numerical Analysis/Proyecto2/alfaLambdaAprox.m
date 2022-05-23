function [ralfa, rlambda] = alfaLambdaAprox(alfa, lambda, x, n, maxiter)
%Sistema de ecuaciones para obtener aproximaciones de los valores alfa y
%lambda:
%    α = λ*promedio(x(i))
%    0 = = n*log(λ) - (n*gamma'(λ*promedio(x(i))))/gamma(λ*promedio(x(i))) + Σlog(x(i))
% IN:
%   alfa = vector de tamaño 2, semilla
%   lambda = aproximacion de lambda
%   x = nuestra muestra aleatoria
%   n = tamaño de la muestra aleatoria
%   maxiter = número de pasos a hacer en las iteraciones
% OUT:
%   alfa = vector de tamaño p con las aproximaciones de alfa en cada paso
%   lambda = vector de tamaño p con las aproximaciones de lambda en cada
%   paso
%Procedimiento mediante bisección.

a = alfa(1);
b = alfa(2);
iter = 1;

falfa = parcialAlfa(a, x, n);
fbeta = parcialAlfa(b, x, n);

while (iter < maxiter && falfa*fbeta < 0)
    c = (a + b)/2;
    fc = parcialAlfa(c, x, n);
    if (falfa*fc < 0)
        b = c;
        fbeta = fc;
    else
        a = c;
        falfa = fc;
    end
    ralfa(iter) = c;
    rlambda(iter) = ralfa(iter)/promedio(x);
    iter = iter + 1;
end

if (fc == 0)
    ralfa(iter) = c;
    rlambda(iter) = ralfa(iter)/promedio(x);
end



end

