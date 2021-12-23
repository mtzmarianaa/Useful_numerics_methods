function [x] = mCG(A, b, x0, tol)
%Version practica
%Necesitamos mas cosas que en el ciclico
%Nunca necesito al mismo tiempo los p, los podemos reescribir
%Si necesitamos el residuo anterior
x = x0;
r = A*x - b;
j = 1;
n = length(x);
p = -r;
%Sabemos que llega en n iteraciones, por eso usamos un for

for k = 0:n-1
    norm_r = dot(r, r);
    alpha = norm_r/dot(p, A*p);
    x = x + alpha*p;
    r = A*x - b;
    if (norm(r, 'inf') < tol)
        break
    end
    beta = dot(r, r)/norm_r;
    p = -r + beta*p;
end

end