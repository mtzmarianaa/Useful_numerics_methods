function [xk, iter] = desMaxIP( f, x0, tol, maxiter ) 
% Purpose: descends in one variable per iteration
% In : f ..... function to minimize
%      x0 ..... initial point
%      tol .... tolerance
%      maxiter ... upper bound for iterations
%
% Out: xf   ... final approximation of x*
%      iter ... number of iterations used
c1 = 0.1;
iter = -1;

xk = x0;

%c1 = 0.1; %c1 esta entre 0 y 1, pero no tan cercano a 1 (no nos sirve numericamente
%y necesitamos espacio para 0<c1<c2<1

for k = 0:maxiter
    g = apGrad(f, xk);
    if norm(g, 'inf') < tol
        iter = k;
        break
    end
    %Paso 1
    d = dMax(g);
    %Paso 2
    [alpha0] = findBisection(f, xk, d, g, c1);
    alpha = 0.99*findAlpha();
    %Si Q no es positiva definida entonces alpha seria negativa (problema)
    assert(alpha>0,'only for convex quadratics')
    
    
    %Paso 3
    xk = xk + alpha*d;
end


%Esto se llama nested function, python no lo tiene, podemos usar los
%parametros pre definidos en la funcion de afuera
%Esta funcion va a calcular el optimo de la interpolacion cuadratica (ver
%notas) una vez que hayamos encontrado alpha0 via interpolacion (mejor calculo)
    function[alphaopt] = findAlpha()
        a = f(xk);
        b = dot(g, d);
        c = (f(xk + alpha0*d) - a - b*alpha0)/alpha0^2;
        alphaopt = -0.5*b/c;
    end


end

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

function d = dMax(g)
% Purpose: descends in the maximum direction possible


        d = -g/norm(g, 2);
        
end