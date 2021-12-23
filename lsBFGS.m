function [xk, k, XK] = lsBFGS( f, x0, maxiter )
% Purpose: approximate a local min of f using the linesearch algorithm
% and the (iBGFS) update formula (to avoid the solution of linear systems)
%
% Same parameters and results as lineDFP,
% with the exception that the (iBGFS) update formula is used.
%
%       XK ... (matrix) column of iteration, norm of gradient, f(xk)
%       and the abs error. 

    k = 0;
    n = length( x0 );
    tol = 10^-5;
    I = speye( n );
    H = speye( n );
    gk = apGrad( f, x0 );
    gnew = 1;
    xk = x0;

    % extras
    N = length(xk);
    xstar = ones(N,1); %analytic minimum
    fk(1) = f(xk); % f(xk)
    norm_g(1) = norm(gnew,2);
    abs_e(1) = norm(xstar - xk,2);

    while norm( gnew ) > tol
        dk = -H*gk;
        
        [ alpha, gnew ] = lineSearch( f, xk, dk, gk );
        
        s = alpha*dk;
        xk = xk + s;
        gamma = gnew - gk;
        rhoinv = dot( s, gamma );
        
        H = ( I - s*gamma'/rhoinv )*H*( I - gamma*s'/rhoinv ) + ( s*s' )/rhoinv;  % O(n^3)
        gk = gnew;
        k = k+1;   % STOP si es grade.
        
        % extras
        fk(k + 1) = f(xk); % f(xk)
        norm_g(k + 1) = norm(gnew,2);
        abs_e(k + 1) = norm(xstar - xk,2);
        
        if  k >= maxiter
            break
        end
        

        
        
    end
%   extras
    XK = [(0:k)', norm_g', fk', abs_e'];
           
end