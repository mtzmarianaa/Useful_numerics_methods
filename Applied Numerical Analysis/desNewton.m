function [xk, iter] = desNewton( f, x0, tol, maxiter )
% Purpose: descends in one variable per iteration
% In : f ... function to minimize
%      x0 ... initial point
%      tol ... tolarance
%      maxiter ... upper bound for iterations
%
% Out: xf   ... final approximation of x*
%      iter ... number of iterations used

    c1 = 0.1;
    iter = -1;
    xk = x0;
    for k = 0:maxiter
        g = apGrad(f, xk);
        if norm(g, 'inf') < tol
            iter = k;
            break
        end
        
        % P1
        d = dNewton( g, f, xk );
        
        % P2
        [alpha] = findBisection(f, xk, d, g, c1);
        
        % P3
        xk = xk + alpha*d;
    end
end

function [alpha] = findBisection(f, xk, d, g, c1)
% line search
    slope = c1*dot(g, d);
    fk = f(xk);
    alpha = 1;
    while f(xk+alpha*d) > fk + alpha*slope
        alpha = 0.5*alpha;
    end
    
    %c2 = 0.9;
    %assert(dot(apGrad(f, xk+alpha*d),d) >= c2/c1*slope, 'Wolfe 2 not satisfied')
end

function d = dNewton( g, f, x )
    H = apHess(f, x);
    d = -H\g;
end