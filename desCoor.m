function [xk, iter] = desCoor( f, x0, tol, maxiter ) 
% Purpose: descends in one variable per iteration
% In : f ..... function to minimize
%      x0 ..... initial point
%      tol .... tolerance
%      maxiter ... upper bound for iterations
%
% Out: xf   ... final approximation of x*
%      iter ... number of iterations used

iter = -1;

xk = x0;

c1 = 0.1; %c1 esta entre 0 y 1, pero no tan cercano a 1 (no nos sirve numericamente
%y necesitamos espacio para 0<c1<c2<1

for k = 0:maxiter
    g = apGrad(f, xk);
    if norm(g, 'inf') < tol
        iter = k;
        break
    end
    %Paso 1
    d = dCor(g);
    %Paso 2
    
    [alpha] = findBisection(f, xk, d, g, c1);
    
    %Paso 3
    xk = xk + alpha*d;
end




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[alpha] = findBisection(f, xk, d, g, c1)
%line search
slope = c1*dot(g, d);
fk = f(xk);
alpha = 1;

while f(xk + alpha*d) > fk + alpha*slope
    
    alpha = 0.5*alpha;
    
end
% 
% %esta funcion nos avisa cuando una condicion no se cumple, como try y
% %catch, pero no hace nada si no sirve
% c2 = 0.99;
% assert(dot(apGrad(f, xk + alpha*d), d) >= c2/c1*slope, 'Wolfe 2 not satisfied')

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function d = dCor(g)
% Purpose: descends in one variable per iteration
% In : f
% x0
% tol
%      maxiter ... upper bound for iterations
%
% Out: xf   ... final approximation of x*
%      iter ... number of iterations used

        n = length(g);
        Id = speye(n);
        [~, pos] = max(abs(g));   %la ~ sirve para que no nos de el resultado en esa coordenada
        d = -sign(g(pos))*Id(:, pos);
        
end
